const fs=require('node:fs'),vm=require('node:vm'),assert=require('node:assert/strict');
const html=fs.readFileSync(process.env.RADARCORE_HTML||__dirname+'/../../radarcore/real/index.html','utf8');
const code=html.split('<script>')[1].split('</script>')[0];
new vm.Script(code);
function harness(responses=[]){
 const els=new Map(),storage=new Map(),calls=[],timers=[];
 const el=id=>{if(!els.has(id))els.set(id,{style:{},textContent:'',innerHTML:'',classList:{toggle(){}},setAttribute(){}});return els.get(id)};
 const ctx={console,Date,Number,JSON,Math,Error,Object,Promise,String,atob,URL,
  localStorage:{removeItem:k=>storage.delete(k)},
  sessionStorage:{getItem:k=>storage.get(k),setItem:(k,v)=>storage.set(k,v),removeItem:k=>storage.delete(k)},
  document:{getElementById:el,querySelectorAll:()=>[]},
  window:{addEventListener(){}},setTimeout:(fn,ms)=>{timers.push({fn,ms});return timers.length},clearTimeout(){},
  fetch:async(url,opts)=>{calls.push({url,opts});const r=responses.shift();if(!r)throw Error('Unexpected fetch');return {ok:r.status!==403,status:r.status||200,json:async()=>r.body}}
 };
 ctx.google={accounts:{id:{initialize(){},renderButton(){},disableAutoSelect(){}}}};ctx.window.google=ctx.google;
 vm.createContext(ctx);vm.runInContext(code,ctx);return {ctx,el,calls,storage,timers};
}
const token=exp=>'head.'+Buffer.from(JSON.stringify({exp})).toString('base64url')+'.sig';
const valid=token(Math.floor(Date.now()/1000)+1800);
const data={meta:{atualizado:'2026-10-22T16:45:00Z'},mesa:{frentes:[]},feed:{},vektor:{registros:[],execucao:{evidencia:'Cobertura parcial de teste'}},kpis:[]};
(async()=>{
 let h=harness();assert.equal(h.ctx.credentialExpiry('bad'),0);
 assert.match(h.ctx.rowRegistry({iniciativa:'<unsafe>',prazo:'Prazo a confirmar',estado:'DILIGÊNCIA'}),/&lt;unsafe&gt;/);
 h=harness([{status:403,body:{error:'acesso_nao_autorizado'}},{body:{ready:false}}]);await h.ctx.onCred({credential:valid});assert.equal(h.el('panel').style.display,'none');assert.equal(h.storage.size,0);
 h=harness([{body:{ok:true,email:'authorized@example.test'}},{body:{ok:true,data:JSON.stringify(data)}}]);await h.ctx.onCred({credential:valid});assert.equal(h.el('panel').style.display,'block');assert.equal(h.storage.get('mc_radar_cred'),valid);assert.equal(h.calls.length,2);assert.ok(h.calls.every(x=>x.url===h.ctx.HUB));assert.match(h.el('freshness').textContent,/24(?:h| horas)/);
 h.timers[0].fn();assert.equal(h.el('panel').style.display,'none');assert.equal(h.storage.size,0);
 h=harness([{body:{ok:true,email:'authorized@example.test'}},{status:403,body:{error:'sessao_expirada'}},{body:{ready:false}}]);await h.ctx.onCred({credential:valid});assert.equal(h.el('panel').style.display,'none');
 h=harness([{body:{ok:true,email:'authorized@example.test'}},{body:{ok:true,data:'broken'}},{body:{ready:false}}]);await h.ctx.onCred({credential:valid});assert.equal(h.el('panel').style.display,'none');assert.equal(h.storage.size,0);
 h=harness([{body:{ready:false}}]);await h.ctx.onCred({credential:token(1)});assert.equal(h.calls.length,1);assert.equal(h.el('panel').style.display,'none');
 h=harness([{body:{ok:true,email:'authorized@example.test'}},{body:{ok:true,data:JSON.stringify(data)}},{body:{ready:true,client_id:'test'}}]);await h.ctx.onCred({credential:valid});h.ctx.sair();assert.equal(h.el('panel').style.display,'none');assert.equal(h.storage.size,0);
 assert.ok(!code.includes("fetch('/radar-data"));assert.ok(!code.includes('12*3600'));assert.ok(code.includes("await callGate(cred,'data')"));
 console.log('PASS: syntax; malformed/expired credential; denied account; server revalidation; protected data only; stale data warning; expiry clears panel; data denial; malformed payload; logout. Mocked runtime: real Google login still unverified.');
})().catch(e=>{console.error(e);process.exitCode=1});


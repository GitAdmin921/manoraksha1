const token=localStorage.getItem('mr_token');if(!token) location.href='/login.html';
const api=async(path,opt={})=>{opt.headers={...(opt.headers||{}),Authorization:'Bearer '+token,'Content-Type':'application/json'};const r=await fetch(path,opt);const d=await r.json();if(!r.ok)throw Error(d.error||'Request failed');return d};
function logout(){localStorage.removeItem('mr_token');location.href='/login.html'}
async function me(){return api('/api/auth/me')}
async function emergency(){if(!confirm('Request immediate human support?'))return;try{await api('/api/emergency',{method:'POST',body:JSON.stringify({reason:'User requested immediate support'})});alert('Support request created. An authorized responder has been notified.')}catch(e){alert(e.message)}}

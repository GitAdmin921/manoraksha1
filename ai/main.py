from fastapi import FastAPI
from pydantic import BaseModel, Field
import re, math
app=FastAPI(title="ManoRaksha AI Support Signal Service",version="1.0.0")
class CheckIn(BaseModel):
    mood:int=Field(ge=1,le=5); anxiety:int=Field(ge=1,le=5); sleep_difficulty:int=Field(ge=1,le=5)
    feels_unsafe:bool=False; message:str=""; language:str="English"
def predict(x:CheckIn):
    score=(6-x.mood)*0.18+x.anxiety*0.16+x.sleep_difficulty*0.10+(0.42 if x.feels_unsafe else 0)
    text=x.message.lower()
    urgent_terms=["unsafe","danger","kill myself","suicide","hurt myself","मरना","आत्महत्या","खतरा","મરવું","આત્મહત્યા","அபாயம்"]
    signals=[]
    if x.feels_unsafe: signals.append("user reported feeling unsafe")
    if x.mood<=2: signals.append("low self-reported mood")
    if x.anxiety>=4: signals.append("high self-reported anxiety")
    if x.sleep_difficulty>=4: signals.append("sleep difficulty reported")
    if any(t in text for t in urgent_terms): score=max(score,.90);signals.append("possible urgent-support language")
    if score>=.82: level="urgent"
    elif score>=.55: level="elevated"
    elif score>=.30: level="moderate"
    else: level="stable"
    explanation="; ".join(signals) if signals else "No strong support-risk signals in this check-in."
    if level in ("urgent","elevated"): explanation+=" Human review is recommended."
    return {"level":level,"score":round(min(score,1),3),"signals":signals,"explanation":explanation,"model":"rule-based-baseline-v1"}
@app.get("/health")
def health(): return {"status":"ok","service":"manoraksha-ai"}
@app.post("/predict")
def prediction(x:CheckIn): return predict(x)

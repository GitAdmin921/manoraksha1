# Baseline training entry point.
# Put ethically sourced, de-identified, licensed data in data/training/.
# Do not commit real survivor/victim records to a public repository.
# Replace this baseline with a validated multilingual model before production.
from pathlib import Path
import json
root=Path(__file__).resolve().parents[2]
files=list((root/"data"/"training").rglob("*.jsonl")) if (root/"data"/"training").exists() else []
print(f"Found {len(files)} JSONL training files.")
print("Baseline model is inference/rule based; production training requires validated labels, consent, bias evaluation and clinical/safeguarding review.")

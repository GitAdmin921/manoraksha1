# AI model

The repository ships with a transparent rule-based baseline so the prototype works without a downloaded model.

Signals:
- self-reported mood
- self-reported anxiety
- sleep difficulty
- explicit unsafe response
- limited keyword signal for urgent-support language

Levels:
stable / moderate / elevated / urgent

Production model roadmap:
1. Collect ethically sourced, de-identified, consented, representative data.
2. Add multilingual intent/emotion models.
3. Evaluate per language and subgroup.
4. Measure false negatives, false positives and calibration.
5. Perform human/safeguarding review.
6. Version models and retain evaluation reports.

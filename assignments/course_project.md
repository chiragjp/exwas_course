# Course Project: Your Own Exposome-Wide Association Study

## Overview

In this project, you will conduct an original ExWAS by selecting or deriving a phenotype of your choice and systematically testing its association with hundreds of environmental exposures using the `nhanespewas` package. The goal is not just to run the pipeline — it is to think critically about what you find, what it means, and what it doesn't mean.

## Part 1: Phenotype Selection or Derivation (10%)

Choose **one** of the following approaches:

### Option A: Select an existing phenotype
Pick a continuous or binary phenotype from the `p_catalog` in nhanespewas that has **not** been extensively studied in the ExWAS literature (i.e., not BMI, glucose, or HbA1c). Justify your choice: why is this phenotype interesting from a public health or biological perspective?

### Option B: Derive a novel phenotype
Construct a composite or derived phenotype from NHANES variables. Examples:

- **Metabolic syndrome score**: combine waist circumference, triglycerides, HDL, fasting glucose, and blood pressure into a continuous risk score
- **Kidney function index**: derive eGFR from serum creatinine using the CKD-EPI equation
- **Inflammation composite**: combine CRP, white blood cell count, and fibrinogen
- **Cardiometabolic ratio**: triglyceride-to-HDL ratio (a marker of insulin resistance)
- **Pulmonary function ratio**: FEV1/FVC ratio
- **Liver function composite**: combine ALT, AST, GGT into a score
- **Allostatic load**: a multi-system physiological dysregulation index

You may also define a **binary phenotype** by thresholding a continuous variable (e.g., eGFR < 60 for chronic kidney disease, metabolic syndrome present/absent by ATP-III criteria).

**Deliverable**: A 1-paragraph justification of your phenotype, including its clinical or biological relevance, how it was measured or derived, and any limitations of the definition.

## Part 2: Conduct the ExWAS (20%)

Using the tools from Modules 4-5, run a full ExWAS:

1. Connect to the nhanespewas database
2. Run `pe_flex_adjust()` (or `logistic_e_flex_adjust()` for binary phenotypes) across all available exposures
3. Use at least **two** adjustment models (e.g., unadjusted and fully adjusted) to assess sensitivity
4. Apply Benjamini-Hochberg FDR correction
5. Report: number of exposures tested, number significant at FDR < 0.05, number significant at Bonferroni threshold

You may use AI tools (e.g., Claude Code) to help write the pipeline code. If you do, cite how you used it.

**Deliverable**: Commented R code and a summary table of results.

## Part 3: Visualize and Describe Results (20%)

Create the following visualizations:

1. **Volcano plot**: effect size vs. -log10(p-value), with FDR and Bonferroni thresholds marked, top hits labeled
2. **Effect size comparison**: plot estimates from the unadjusted model vs. the fully adjusted model — highlight any sign reversals
3. **One additional visualization** of your choice (e.g., delta R-squared bar chart, exposure category breakdown, forest plot for a top hit across NHANES waves)

For each plot, write a **2-3 sentence interpretation** of what the plot shows.

**Deliverable**: Three figures with captions and interpretations.

## Part 4: Interpret Your Top 5 Hits (30%)

For each of your **top 5 FDR-significant associations**, write a structured interpretation that addresses:

### a) Biological plausibility
- Is there a known biological mechanism linking this exposure to your phenotype?
- Cite at least one relevant paper or review per hit (a brief literature search is expected)

### b) Confounding assessment
- Draw a DAG specific to this exposure-phenotype pair
- Identify at least one confounder that the standard adjustment set (age, sex, race/ethnicity, income) likely **misses**
- Predict whether your estimate is likely biased toward or away from the null, and in which direction

### c) Sensitivity to adjustment
- Did the estimate change substantially between the unadjusted and adjusted models?
- If yes, what does this imply about confounding? If no, does stability mean the estimate is unconfounded?

### d) Replication potential
- Would you expect this finding to replicate in an independent NHANES wave? Why or why not?
- What would strengthen or weaken your confidence in this association?

**Deliverable**: A structured write-up (approximately 1 page per hit, 5 pages total).

## Part 5: Limitations and Future Directions (20%)

Write a 2-page discussion addressing:

1. **The confounding problem**: How does the per-association confounding issue (Module 3) affect your specific results? Which of your top hits are most vulnerable to unmeasured confounding, and why?

2. **Cross-sectional limitations**: For which of your hits is reverse causation a plausible concern? Give a specific example of how the phenotype could affect the exposure rather than vice versa.

3. **Measurement considerations**: Are any of your top exposures measured with known limitations (short half-life, high assay variability, below-detection-limit issues)? How might measurement error affect your estimates?

4. **A validation plan**: If you had unlimited resources, how would you validate your most promising finding? Describe a triangulation strategy (at least 3 approaches from Module 7) tailored to your specific hit.

5. **What would LC-HRMS add?**: Would untargeted exposomics (Module 10) be useful for your phenotype? What unknown exposures might be relevant that NHANES does not measure?

**Deliverable**: A 2-page discussion.

## Grading Rubric

| Component | Weight | Key criteria |
|-----------|--------|-------------|
| Phenotype selection/derivation | 10% | Originality, justification, appropriate definition |
| ExWAS execution | 20% | Correct implementation, multiple adjustment models, FDR |
| Visualization | 20% | Clear figures, appropriate plot choices, correct interpretation |
| Top 5 interpretation | 30% | DAG quality, confounding reasoning, biological plausibility, literature engagement |
| Limitations discussion | 20% | Depth of reasoning, specificity to own results, validation plan quality |

## Important Notes

- **Code can be automated; interpretation cannot.** The majority of your grade (70%) comes from interpretation, reasoning, and discussion — not from running the pipeline.
- **There are no "wrong" phenotypes.** A null ExWAS (few or no significant hits) is a valid result if interpreted thoughtfully. Discuss why you found few hits — is it low power, weak effects, or a phenotype truly unrelated to the measured exposome?
- **Honest assessment of limitations is valued.** Acknowledging what your analysis cannot tell you is as important as reporting what it can.
- **Use of AI tools is permitted but must be cited.** If you use Claude Code, ChatGPT, or similar tools to generate code or draft text, state how you used them and what you modified. The interpretation must be your own.


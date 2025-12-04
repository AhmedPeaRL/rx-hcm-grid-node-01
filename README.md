# # Hybrid Consciousness Model (HCM)
A Hybrid Neuro–Energetic and Temporal Framework for Consciousness Research

---

## Overview
The Hybrid Consciousness Model (HCM) proposes that conscious processing emerges from three simultaneously interacting domains:

1. Neural Domain (N):  
   Measurable brain activity such as EEG synchrony, coherence, cross-frequency coupling, and cortical integration.

2. NeuroEnergetic Field Domain (E):  
   Low-frequency environmental and biofield resonance patterns (Schumann-like bands, VLF electromagnetic activity, physiological field emissions).

3. Symbolic-Cognitive Domain (S):  
   Linguistic structure, semantic coherence, reasoning patterns, narrative integration, and symbolic processing.

The central hypothesis:

Consciousness level C is determined by the dynamic interaction of N, E, and S:

C = f(N, E, S)

We operationalize this using the **Cognitive Coherence Index (CCI)**:

CCI = (N_score * E_score * S_score)^(1/3)

This repository provides the complete theoretical framework, computational models, analysis pipelines, and experimental protocols necessary to replicate and test HCM scientifically.

---

## Goals of This Repository
- Provide an open-source and testable formal description of HCM.  
- Implement computational models and simulations.  
- Offer reproducible analysis pipelines for EEG + field data.  
- Supply experimental protocols for N–E–S coherence measurement.  
- Maintain the manuscript for formal publication (e.g., JCS).

All materials will be archived with a DOI through Zenodo upon the first stable release.

---

## Quickstart

### 1. Clone the repository

git clone <your-repo-url> cd HCM-Temporal-Consciousness-Framework

### 2. Create and activate environment

python -m venv venv source venv/bin/activate     # Linux/Mac venv\Scripts\activate        # Windows

### 3. Install dependencies

pip install -r src/requirements.txt

### 4. Run the demo simulation

python src/simulations/run_demo_simulation.py

This produces:
- Toy EEG + NEF simulated signals  
- Temporal binding visualization  
- A demo CCI value  

---

## Repository Structure (High-Level)

theory/                - Formal mathematical model of HCM docs/                  - Computational graph, diagrams, definitions manuscript/            - Draft scientific paper + figures src/                   - Models, simulations, utilities experiments/           - Protocols, analysis pipelines, instrumentation data/                  - Sample and simulated datasets diagrams/              - Visual explanatory diagrams notebooks/             - Interactive Jupyter notebooks .github/workflows/     - CI workflows for tests and docs

---

## Research Roadmap (Current Priorities)
1. Formalize NEF–Neural coupling equations in
   `theory/HCM_Resonance_Model.md`

2. Implement core temporal integrator model in  
   `src/models/temporal_integrator.py`

3. Build simulation notebook for NEF modulation in  
   `src/simulations/NEF_modulation_sim.ipynb`

4. Establish EEG–NEF coherence protocol in  
   `experiments/protocols/eeg_nef_coherence_protocol.md`

5. Prepare first Zenodo release (v0.1) for DOI assignment.

---

## Citation (Draft)
Salahuddin, A. (2025). Hybrid Consciousness Model (HCM):  
A Hybrid Neuro–Energetic and Temporal Framework.  
GitHub Repository. Version: v0.1 (DOI to be issued).

---

## License
- Code is released under the MIT License.  
- Documentation and manuscript are under CC-BY-4.0.

---

## Contact
Project Lead: Ahmed Salahuddin  
Email: ahmedsalah88622@gmail.com

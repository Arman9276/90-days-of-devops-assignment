Developer
   │
   │ Push Code
   ▼
GitHub Repository
   │
   │ Trigger CI/CD Pipeline
   ▼
Stage 1: Test
   ├─ Install Dependencies
   ├─ Run Unit Tests
   └─ Check Code Quality
   │
   ▼
Stage 2: Build
   ├─ Build Application
   ├─ Create Docker Image
   └─ Push Image to Docker Registry
   │
   ▼
Stage 3: Deploy
   ├─ Pull Docker Image
   └─ Deploy to Staging Server
   │
   ▼
Staging Environment (App Running)

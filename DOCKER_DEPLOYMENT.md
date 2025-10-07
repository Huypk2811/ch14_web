# Email List Application - Docker & GitHub Deployment

## 🐳 **DOCKER DEPLOYMENT:**

### Build Docker Image:
```bash
# Build WAR file first
mvn clean package

# Build Docker image
docker build -t ch14-email-app .

# Run container locally (test)
docker run -p 8080:8080 ch14-email-app
```

### Test Locally:
```
http://localhost:8080/
```

## 🚀 **RENDER DEPLOYMENT:**

### 1. Push to GitHub:
```bash
git init
git add .
git commit -m "Initial commit - Email List App with Docker"
git branch -M main
git remote add origin https://github.com/Huypk2811/ch14_web.git
git push -u origin main
```

### 2. Deploy on Render:
1. Go to [Render Dashboard](https://dashboard.render.com/)
2. Click **"New"** → **"Web Service"**
3. Connect GitHub repository: `Huypk2811/ch14_web`
4. Configure:
   - **Name:** `ch14-email-app`
   - **Environment:** `Docker`
   - **Region:** `Singapore` (gần VN nhất)
   - **Branch:** `main`
   - **Build Command:** `mvn clean package && docker build -t ch14-email-app .`
   - **Start Command:** (leave empty - Dockerfile handles this)

### 3. Environment Variables (on Render):
- **GMAIL_USER:** `huypk2811@gmail.com`
- **GMAIL_APP_PASSWORD:** `zoct frjq dpnp bjys`

## 📱 **ACCESS YOUR APP:**
After deployment, your app will be available at:
```
https://ch14-email-app.onrender.com/
```

## 🔧 **DOCKER COMMANDS:**

### Local Development:
```bash
# Build and run
mvn clean package
docker build -t ch14-email-app .
docker run -p 8080:8080 ch14-email-app

# View logs
docker logs <container-id>

# Stop container
docker stop <container-id>
```

### Production Ready:
```bash
# Build with tag for production
docker build -t ch14-email-app:v1.0 .

# Run with environment variables
docker run -p 8080:8080 \
  -e GMAIL_USER=huypk2811@gmail.com \
  -e GMAIL_APP_PASSWORD="zoct frjq dpnp bjys" \
  ch14-email-app:v1.0
```

## 🌐 **GITHUB REPO STRUCTURE:**
```
ch14_web/
├── Dockerfile
├── .dockerignore
├── pom.xml
├── src/
│   └── java/
│       └── murach/
├── web/
│   ├── index.jsp
│   └── thanks.jsp
├── README.md
└── DOCKER_DEPLOYMENT.md
```

## ✅ **FEATURES:**
- ✅ Real Gmail integration
- ✅ Docker containerized
- ✅ Render.com deployment ready
- ✅ Environment variables support
- ✅ Production-ready configuration

## 🎯 **NEXT STEPS:**
1. Push code to GitHub
2. Deploy on Render
3. Test email functionality
4. Share public URL: `https://ch14-email-app.onrender.com/`
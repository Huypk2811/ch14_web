# 🚀 HƯỚNG DẪN DEPLOY LÊN RENDER.COM

## ✅ **ĐÃ HOÀN THÀNH:**
- ✅ Dockerfile đã tạo
- ✅ Code đã push lên GitHub: https://github.com/Huypk2811/ch14_web
- ✅ WAR file build thành công
- ✅ Email functionality hoạt động local

## 🌐 **DEPLOY LÊN RENDER.COM:**

### Bước 1: Truy cập Render Dashboard
1. Vào [https://dashboard.render.com/](https://dashboard.render.com/)
2. Đăng nhập bằng GitHub account

### Bước 2: Tạo Web Service
1. Click **"New"** → **"Web Service"**
2. Connect GitHub repository: **"Huypk2811/ch14_web"**
3. Click **"Connect"**

### Bước 3: Configure Deployment
**Basic Settings:**
- **Name:** `ch14-email-app`
- **Environment:** `Docker`
- **Region:** `Singapore` (closest to Vietnam)
- **Branch:** `main`

**Build & Deploy:**
- **Dockerfile Path:** `./Dockerfile` (default)
- **Build Command:** (để trống - Docker handle)
- **Start Command:** (để trống - Docker handle)

### Bước 4: Environment Variables (Optional)
Nếu muốn hide credentials, add environment variables:
- **GMAIL_USER:** `huypk2811@gmail.com`
- **GMAIL_APP_PASSWORD:** `zoct frjq dpnp bjys`

### Bước 5: Deploy
1. Click **"Create Web Service"**
2. Render sẽ tự động:
   - Clone GitHub repo
   - Build Docker image
   - Deploy container
   - Assign public URL

## 🔗 **EXPECTED RESULT:**
Sau khi deploy thành công:
```
Your app will be available at:
https://ch14-email-app.onrender.com/

or similar URL assigned by Render
```

## 📋 **BUILD PROCESS ON RENDER:**
```bash
# Render sẽ tự động chạy:
1. git clone https://github.com/Huypk2811/ch14_web.git
2. mvn clean package  (tự động detect Maven)
3. docker build -t app .
4. docker run -p 10000:8080 app
```

## ⏱️ **DEPLOYMENT TIME:**
- **First Deploy:** 5-10 minutes
- **Subsequent Deploys:** 2-5 minutes
- **Free Tier:** May sleep after 15 minutes inactivity

## 🧪 **TESTING AFTER DEPLOY:**
1. **Access URL:** `https://your-app.onrender.com/`
2. **Fill Email Form:** Use real email address
3. **Submit Form:** Should redirect to thanks page
4. **Check Email:** Should receive welcome email
5. **Verify:** Email sent from `huypk2811@gmail.com`

## 🔧 **TROUBLESHOOTING:**

### Build Fails:
- Check Dockerfile syntax
- Ensure `target/ch14_ex1_email.war` exists
- Verify Maven dependencies

### App Doesn't Start:
- Check Render logs for errors
- Verify port 8080 in Dockerfile
- Check Tomcat startup logs

### Email Not Working:
- Verify Gmail credentials
- Check Gmail app password
- Confirm 2FA enabled

## 📱 **MOBILE ACCESS:**
App sẽ work trên mobile browsers:
- **iOS Safari**
- **Android Chrome**
- **Responsive design** from main.css

## 💰 **RENDER PRICING:**
- **Free Tier:** Đủ cho test/demo
- **Paid Plan:** $7/month cho production
- **Custom Domain:** Available on paid plans

## 🎯 **NEXT STEPS AFTER DEPLOY:**
1. **Share Public URL** với friends/employer
2. **Test Email Functionality** với multiple email providers
3. **Monitor Logs** trong Render dashboard
4. **Optional:** Setup custom domain

## 🔒 **SECURITY NOTES:**
- Gmail credentials trong code (OK cho demo)
- Production: Use environment variables
- Render handles HTTPS automatically
- No sensitive data exposed in logs

## 🎉 **FINAL RESULT:**
Sau deploy thành công:
```
✅ Public URL: https://ch14-email-app.onrender.com/
✅ Real Email Sending: Working
✅ Professional Portfolio: Ready
✅ Deployable Docker App: Complete
```

---
**Repository:** https://github.com/Huypk2811/ch14_web  
**Live Demo:** https://ch14-email-app.onrender.com/ (after deployment)
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title> Ravindra | DevOps & SRE Engineer</title>
    <link rel="icon" href="images/devops-icon.png">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(to right, #e0f7fa, #ffffff);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .header, .footer {
            background-color: #004d40;
            color: white;
            padding: 20px 0;
        }
        .content-section {
            padding: 30px;
        }
        h1, h2, h3 {
            color: #00695c;
        }
        .project-list li {
            margin-bottom: 10px;
        }
    </style>
</head>
<body>

<div class="container-fluid header text-center">
    <h1>Ravindra</h1>
    <h4>Senior DevOps Engineer | Cloud & Automation Enthusiast</h4>
</div>

<div class="container content-section">
    <h2>About Me</h2>
    <p>Hello! I’m <strong>Ravindra Naik</strong>, a passionate and experienced DevOps Engineer with a strong background in AWS cloud services, CI/CD pipelines, Infrastructure as Code, and containerization technologies.</p>

    <h3>🔧 Skills & Tools</h3>
    <ul class="list-group list-group-flush">
        <li class="list-group-item">☁️ AWS: EC2, S3, VPC, RDS, Route 53, CloudFormation, IAM, Lambda</li>
        <li class="list-group-item">🐳 Docker, Kubernetes (EKS), Helm</li>
        <li class="list-group-item">⚙️ CI/CD: Jenkins, GitHub Actions, GitLab CI</li>
        <li class="list-group-item">🔐 Terraform, Ansible, Shell Scripting</li>
        <li class="list-group-item">📈 Monitoring: Prometheus, Grafana, CloudWatch</li>
    </ul>

    <h3>💼 Projects</h3>
    <ul class="project-list">
        <li>✔️ Migrated on-premise apps to AWS with fully automated infrastructure using Terraform</li>
        <li>✔️ Deployed scalable microservices using Docker and Kubernetes (EKS)</li>
        <li>✔️ Designed CI/CD pipelines with Jenkins, GitHub Actions, and AWS CodeDeploy</li>
        <li>✔️ Implemented real-time monitoring with Prometheus + Grafana for production apps</li>
    </ul>

    <h3>🌍 Server Info</h3>
    <p>
        <% 
            InetAddress inetAddress = InetAddress.getLocalHost();
            String serverIp = inetAddress.getHostAddress();
            out.println("Server Hostname: " + inetAddress.getHostName() + "<br>");
            out.println("Server IP Address: " + serverIp + "<br>");
        %>
        Client IP: <%= request.getRemoteAddr() %> <br>
        Client Host: <%= request.getRemoteHost() %>
    </p>

    <h3>📫 Contact Me</h3>
    <p>Email: <a href="mailto:ravindranaik.devops@gmail.com">ravindranaik.devops@gmail.com</a></p>
    <p>LinkedIn: <a href="https://linkedin.com/in/ravindranaik" target="_blank">linkedin.com/in/ravindranaik</a></p>
</div>

<div class="container-fluid footer text-center">
    <p>&copy; 2025 Ravindra Naik | DevOps Engineer | All Rights Reserved</p>
</div>

</body>
</html>

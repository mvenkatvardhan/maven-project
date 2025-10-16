<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Abu Sufiyan - Portfolio</title>
    <style>
        /* CSS styles as in original HTML */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Arial', sans-serif;
        }

        body {
            background: linear-gradient(rgba(255, 255, 255, 0.5), rgba(255, 255, 255, 0.5)),
                url('https://images.unsplash.com/photo-1579783900882-c0d3dad7b119?ixlib=rb-4.0.3&auto=format&fit=crop&w=1350&q=80');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            color: #000000;
            line-height: 1.6;
            transition: all 0.3s ease;
            position: relative;
            overflow-x: hidden;
        }

        .dark-mode {
            background: #1a1a1a;
            color: #e0e0e0;
        }

        .background-video {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            object-fit: cover;
            z-index: -2;
            opacity: 0.6;
        }

        .dark-mode .background-video {
            display: block;
        }

        .dark-mode-overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.3);
            z-index: -1;
        }

        .dark-mode .dark-mode-overlay {
            display: block;
        }

        .dark-mode .section {
            background: none !important;
        }

        .section {
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 2rem;
            text-align: center;
            position: relative;
        }

        .hero {
            color: #fff;
            background: rgba(0, 0, 0, 0.5);
            padding: 2rem;
            border-radius: 10px;
            animation: fadeIn 2s ease-in-out;
        }

        .dark-mode .hero {
            background: none;
        }

        @keyframes fadeIn {
            0% { opacity: 0; transform: translateY(20px); }
            100% { opacity: 1; transform: translateY(0); }
        }

        .hero h1 {
            font-size: 3.5rem;
            margin-bottom: 1rem;
        }

        .hero p {
            font-size: 1.5rem;
            margin-bottom: 0.5rem;
        }

        .hero .tagline {
            font-size: 1rem;
            font-style: italic;
            opacity: 0.8;
            margin-bottom: 1rem;
        }

        .contact-info {
            display: flex;
            flex-direction: column;
            gap: 0.5rem;
            font-size: 1rem;
        }

        .contact-info a {
            color: #66b0ff;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .contact-info a:hover {
            color: #3385ff;
        }

        .contact-info span {
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .summary {
            background: rgba(0, 0, 0, 0.6);
            color: #fff;
            padding: 2rem;
            border-radius: 10px;
        }

        .dark-mode .summary {
            background: none;
        }

        .summary p {
            max-width: 800px;
            font-size: 1.2rem;
            padding: 8px;
        }

        .skills, .contact {
            background-color: #ffffff;
            padding: 2rem;
        }

        .dark-mode .skills, .dark-mode .contact {
            background-color: transparent;
        }

        .skills-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(120px, 1fr));
            gap: 1rem;
            max-width: 900px;
            width: 100%;
            margin-top: 8px;
        }

        .skill-item {
            background-color: #f0f0f0;
            padding: 0.5rem;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            font-size: 0.9rem;
            text-align: center;
        }

        .dark-mode .skill-item {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            box-shadow: 0 4px 16px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
        }

        .dark-mode .skill-item:hover {
            transform: translateY(-5px);
        }

        .contact form {
            max-width: 600px;
            width: 100%;
            display: flex;
            flex-direction: column;
            gap: 1rem;
        }

        .contact input, .contact textarea {
            padding: 0.75rem;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 1rem;
            background-color: #fff;
            color: #333;
        }

        .dark-mode .contact input, .dark-mode .contact textarea {
            background-color: #333333;
            border-color: #3a555;
            color: #e0e0e0;
        }

        .contact textarea {
            resize: vertical;
            min-height: 150px;
        }

        .contact button {
            padding: 0.75rem;
            background-color: #007bff;
            color: #ffffff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1rem;
            transition: background-color 0.3s ease;
        }

        .dark-mode .contact button {
            background-color: #66b0ff;
        }

        .contact button:hover {
            background-color: #0056b3;
        }

        .dark-mode .contact button:hover {
            background-color: #3385ff;
        }

        .toggle-button {
            position: fixed;
            bottom: 1rem;
            right: 1rem;
            width: 36px;
            height: 36px;
            background-color: #000000;
            color: #ffffff;
            border: none;
            border-radius: 50%;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1rem;
            z-index: 1100;
            transition: background-color 0.3s ease;
        }

        .dark-mode .toggle-button {
            background-color: #e0e0e0;
            color: #000000;
        }

        .toggle-button::before {
            content: '☀';
        }

        .dark-mode .toggle-button::before {
            content: '🌙';
        }

        @media (max-width: 768px) {
            .hero h1 {
                font-size: 2.5rem;
            }

            .hero p {
                font-size: 1.2rem;
            }

            .hero .tagline {
                font-size: 0.9rem;
            }

            .summary p {
                font-size: 1rem;
                padding: 0.5rem;
            }

            .contact form {
                padding: 0 1rem;
            }
        }

        @media (max-width: 480px) {
            .hero h1 {
                font-size: 2rem;
            }

            .hero p {
                font-size: 1rem;
            }

            .hero .tagline {
                font-size: 0.8rem;
            }

            .contact-info {
                font-size: 0.9rem;
            }

            .skills-grid {
                grid-template-columns: repeat(auto-fit, minmax(100px, 1fr));
            }
        }
    </style>
</head>
<body>
    <div class="dark-mode-overlay"></div>
    <video class="background-video" preload="auto" autoplay loop muted playsinline 
        poster="https://images.unsplash.com/photo-1462332420958-a1d4e8b2df97?ixlib=rb-4.0.3&auto=format&fit=crop&w=1350&q=80">
        <source src="https://static.videezy.com/system/resources/previews/000/043/778/original/starfull_sky.mp4" type="video/mp4" />
    </video>

    <button class="toggle-button" onclick="toggleDarkMode()"></button>

    <section id="hero" class="section hero">
        <h1>M vardhan devops</h1>
        <p>DevOps & Java Full Stack Developer</p>
        <p class="tagline">I like minimal designs so, this is minimal without any distractions</p>
    </section>

    <section id="summary" class="section summary">
        <h2>Summary</h2>
        <p>Java Full Stack Developer and DevOps with 3+ years of experience in designing and deploying high-scale microservices applications with Java, Spring Boot, Hibernate, Angular, and React. Expert in DevOps methodologies, using AWS, Docker, Kubernetes, Jenkins, and CI/CD pipelines to drive deployments. Successfully tackled deployment issues. Experienced with MySQL, MongoDB, and Agile methodologies, spearhead innovative autonomy systems through teamwork, producing high-quality, secure solutions.</p>
    </section>

    <section id="skills" class="section skills">
        <h2>Skills</h2>
        <div class="skills-grid">
            <div class="skill-item">Java</div>
            <div class="skill-item">JavaScript</div>
            <div class="skill-item">Python</div>
            <div class="skill-item">TypeScript</div>
            <div class="skill-item">Shell Scripting</div>
            <div class="skill-item">Spring Boot</div>
            <div class="skill-item">Hibernate</div>
            <div class="skill-item">Angular</div>
            <div class="skill-item">React</div>
            <div class="skill-item">Node.js</div>
            <div class="skill-item">MongoDB</div>
            <div class="skill-item">MySQL</div>
            <div class="skill-item">PostgreSQL</div>
            <div class="skill-item">Redis</div>
            <div class="skill-item">Git</div>
            <div class="skill-item">GitHub</div>
            <div class="skill-item">GitLab</div>
            <div class="skill-item">Jenkins</div>
            <div class="skill-item">Docker</div>
            <div class="skill-item">Kubernetes</div>
            <div class="skill-item">ArgoCD</div>
            <div class="skill-item">Terraform</div>
            <div class="skill-item">Ansible</div>
            <div class="skill-item">NGINX</div>
            <div class="skill-item">AWS</div>
            <div class="skill-item">Prometheus</div>
            <div class="skill-item">Grafana</div>
            <div class="skill-item">ELK Stack</div>
            <div class="skill-item">Nagios</div>
            <div class="skill-item">Maven</div>
            <div class="skill-item">JUnit</div>
            <div class="skill-item">Selenium</div>
            <div class="skill-item">SonarQube</div>
            <div class="skill-item">Postman</div>
            <div class="skill-item">Swagger</div>
            <div class="skill-item">Jira</div>
            <div class="skill-item">Linux</div>
            <div class="skill-item">Microservices</div>
            <div class="skill-item">CI/CD</div>
            <div class="skill-item">Agile</div>
            <div class="skill-item">Scrum</div>
            <div class="skill-item">RESTful APIs</div>
            <div class="skill-item">Hibernate ORM</div>
            <div class="skill-item">Software Debugging</div>
        </div>
    </section>

    <section id="contact" class="section contact">
        <h2>Contact Me</h2>
        <form id="contact-form" action="http://localhost:3000/send" method="POST">
            <input type="text" name="name" placeholder="Your Name" required />
            <input type="email" name="email" placeholder="Your Email" required />
            <textarea name="message" placeholder="Your Message" required></textarea>
            <button type="submit">Send Message</button>
        </form>
    </section>

    <script>
        function toggleDarkMode() {
            document.body.classList.toggle('dark-mode');
            localStorage.setItem('darkMode', document.body.classList.contains('dark-mode'));
            const video = document.querySelector('.background-video');
            if (document.body.classList.contains('dark-mode')) {
                tryPlayVideo(video);
            } else {
                video.pause();
                video.currentTime = 0;
            }
        }

        function tryPlayVideo(video) {
            video.play().then(() => {
                console.log('Galaxy video is playing successfully.');
            }).catch(error => {
                console.error('Video playback failed:', error.message);
                console.log('Waiting for user interaction to retry...');
                document.addEventListener('click', function retryPlay() {
                    video.play().then(() => {
                        console.log('Video played after user interaction.');
                    }).catch(err => {
                        console.error('Retry failed:', err.message);
                    });
                    document.removeEventListener('click', retryPlay);
                }, { once: true });
            });
        }

        // Load dark mode preference
        if (localStorage.getItem('darkMode') === 'true') {
            document.body.classList.add('dark-mode');
            const video = document.querySelector('.background-video');
            tryPlayVideo(video);
        }

        // Ensure seamless looping
        const video = document.querySelector('.background-video');
        video.addEventListener('ended', () => {
            video.currentTime = 0;
            video.play();
            console.log('Video looped successfully.');
        });

        // Log video events
        video.addEventListener('error', () => {
            console.error('Video failed to load from source: https://static.videezy.com/system/resources/previews/000/043/778/original/starfull_sky.mp4');
            console.log('Fallback image should be visible. Check network, CORS, or source URL.');
        });
        video.addEventListener('loadeddata', () => {
            console.log('Galaxy video loaded successfully.');
        });
        video.addEventListener('play', () => {
            console.log('Galaxy video playback started.');
        });
        video.addEventListener('stalled', () => {
            console.warn('Video stalled. Check network connection.');
        });

        // Form submission
        document.getElementById('contact-form').addEventListener('submit', async function(e) {
            e.preventDefault();
            const form = e.target;
            const formData = new FormData(form);

            try {
                const response = await fetch(form.action, {
                    method: form.method,
                    body: formData
                });
                const result = await response.json();
                alert(result.message);
                form.reset();
            } catch (error) {
                console.error('Form submission failed:', error);
                alert('Failed to send message. Please try again later.');
            }
        });
    </script>
</body>
</html>
    

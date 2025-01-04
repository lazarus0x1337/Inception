const http = require('http');

const server = http.createServer((req, res) => {
    res.writeHead(200, {'Content-Type': 'text/html'});
    res.end(`
        <!DOCTYPE html>
        <html lang="en">
            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Inception 42 Project</title>
                <style>
                    /* Global Styles */
                    body {
                        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                        margin: 0;
                        background-color: #f0f0f5;
                    }
                    h1, h2 {
                        color: #4CAF50;
                    }

                    /* Header Styles */
                    header {
                        background-color: #333;
                        color: white;
                        text-align: center;
                        padding: 20px 0;
                    }

                    header h1 {
                        margin: 0;
                    }

                    /* Main Section Styles */
                    main {
                        padding: 40px 20px;
                        text-align: center;
                    }

                    /* Project Info Section */
                    .project-info {
                        display: flex;
                        flex-direction: column;
                        align-items: center;
                        background-color: white;
                        margin: 20px;
                        padding: 20px;
                        border-radius: 8px;
                        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                    }

                    .project-info h2 {
                        margin-top: 0;
                    }

                    .project-info p {
                        font-size: 1.2rem;
                        color: #555;
                    }

                    /* Features Section */
                    .features {
                        display: grid;
                        grid-template-columns: 1fr 1fr;
                        gap: 20px;
                        margin: 30px 0;
                    }

                    .feature-card {
                        background-color: #fff;
                        border-radius: 8px;
                        padding: 20px;
                        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                        text-align: center;
                    }

                    .feature-card h3 {
                        margin-top: 0;
                        color: #4CAF50;
                    }

                    .feature-card p {
                        font-size: 1rem;
                        color: #666;
                    }

                    /* Footer Styles */
                    footer {
                        background-color: #333;
                        color: white;
                        text-align: center;
                        padding: 10px 0;
                        position: fixed;
                        bottom: 0;
                        width: 100%;
                    }

                    /* Responsive Design */
                    @media (max-width: 768px) {
                        .features {
                            grid-template-columns: 1fr;
                        }
                    }
                </style>
            </head>
            <body>
                <header>
                    <h1>Inception Project - 42</h1>
                    <p>Welcome to my Inception Project for 42 School</p>
                </header>
                <main>
                    <section class="project-info">
                        <h2>About the Project</h2>
                        <p>This project is the first step towards building a foundation for our journey at 42 School. It includes various exercises that help us configure and manage our development environment.</p>
                    </section>

                    <section class="features">
                        <div class="feature-card">
                            <h3>Docker Setup</h3>
                            <p>Learn how to work with containers and configure a robust environment using Docker.</p>
                        </div>
                        <div class="feature-card">
                            <h3>Networking</h3>
                            <p>Understand networking, reverse proxies, and handling HTTP requests using NGINX and other tools.</p>
                        </div>
                        <div class="feature-card">
                            <h3>Version Control</h3>
                            <p>Master version control systems like Git to track changes and collaborate with others.</p>
                        </div>
                        <div class="feature-card">
                            <h3>System Configuration</h3>
                            <p>Configure Linux environments and automate tasks to streamline your workflow.</p>
                        </div>
                    </section>
                </main>
                <footer>
                    <p>&copy; 2025 My Inception Project - 42</p>
                </footer>
            </body>
        </html>
    `);
});
const PORT = 8000;
server.listen(PORT, () => {
});
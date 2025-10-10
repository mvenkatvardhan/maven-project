<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Matrix Rain</title>
    <style>
        body, html {
            margin: 0;
            padding: 0;
            overflow: hidden;
            background-color: black;
            height: 100%;
        }
        canvas {
            display: block;
        }
    </style>
</head>
<body>

<canvas id="matrixCanvas"></canvas>

<script>
    const canvas = document.getElementById('matrixCanvas');
    const ctx = canvas.getContext('2d');

    function resizeCanvas() {
        canvas.width = window.innerWidth;
        canvas.height = window.innerHeight;
    }

    resizeCanvas();
    window.addEventListener('resize', resizeCanvas);

    const fontSize = 16;
    const columns = Math.floor(canvas.width / fontSize);
    const drops = Array(columns).fill(1);

    // Convert words to binary strings
    const words = ["matrix", "cyber", "code", "linux", "ubuntu", "kernel", "shell", "script", "binary", "system"];
    const binaryStream = words
        .map(word => word.split('')
            .map(char => char.charCodeAt(0).toString(2).padStart(8, '0'))
            .join(''))
        .join('');
    const matrixChars = binaryStream.split('');
    const columnCharIndex = Array(columns).fill(0);

    function drawMatrix() {
        ctx.fillStyle = "rgba(0, 0, 0, 0.05)";
        ctx.fillRect(0, 0, canvas.width, canvas.height);

        ctx.fillStyle = "#0F0";
        ctx.font = fontSize + "px monospace";

        for (let i = 0; i < drops.length; i++) {
            const text = matrixChars[columnCharIndex[i] % matrixChars.length];
            ctx.fillText(text, i * fontSize, drops[i] * fontSize);
            columnCharIndex[i]++;

            if (drops[i] * fontSize > canvas.height && Math.random() > 0.975) {
                drops[i] = 0;
            }

            drops[i]++;
        }
    }

    setInterval(drawMatrix, 50);
</script>

</body>
</html>


    

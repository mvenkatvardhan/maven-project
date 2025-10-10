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

#!/bin/bash

# StudySauce Vercel Deployment Script

echo "🎧 StudySauce - Vercel Deployment Helper"
echo "========================================"

# Check if git is initialized
if [ ! -d ".git" ]; then
    echo "Initializing git repository..."
    git init
    git add .
    git commit -m "Initial commit - StudySauce podcast generator"
fi

# Check if Vercel CLI is installed
if ! command -v vercel &> /dev/null; then
    echo "⚠️  Vercel CLI not found. Installing..."
    npm install -g vercel
fi

echo "🚀 Starting Vercel deployment..."

# Deploy to Vercel
vercel

echo ""
echo "📋 Next Steps:"
echo "1. Set environment variables in Vercel dashboard:"
echo "   - GEMINI_API_KEY"
echo "   - ELEVENLABS_API_KEY"
echo ""
echo "2. Or set them via CLI:"
echo "   vercel env add GEMINI_API_KEY"
echo "   vercel env add ELEVENLABS_API_KEY"
echo ""
echo "3. Redeploy with environment variables:"
echo "   vercel --prod"
echo ""
echo "✅ Deployment initiated! Check your Vercel dashboard for status."

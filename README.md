# studysauce-podcast-generator

A Flask application that converts PDF documents into engaging podcast discussions using AI-generated content and voice synthesis.

## Features

- Upload PDF documents
- AI-powered content summarization using Google's Gemini
- Natural conversation script generation
- Voice synthesis with ElevenLabs
- Customizable podcast hosts and length
- Real-time processing status

## Deployment

### Vercel Deployment

This application is configured for Vercel deployment with serverless functions.

#### Prerequisites

1. **API Keys**: You'll need API keys for:

   - Google Gemini API
   - ElevenLabs API

2. **Vercel Account**: Sign up at [vercel.com](https://vercel.com)

#### Deploy to Vercel

1. **Clone and Push to GitHub**:

   ```bash
   git add .
   git commit -m "Ready for Vercel deployment"
   git push origin main
   ```

2. **Deploy via Vercel Dashboard**:

   - Go to [vercel.com/dashboard](https://vercel.com/dashboard)
   - Click "Import Project"
   - Select your GitHub repository
   - Vercel will automatically detect the Flask configuration

3. **Set Environment Variables**:
   In your Vercel project dashboard, go to Settings → Environment Variables and add:

   ```
   GEMINI_API_KEY=your_gemini_api_key_here
   ELEVENLABS_API_KEY=your_elevenlabs_api_key_here
   ```

4. **Deploy**:
   - Vercel will automatically deploy your application
   - Your app will be available at `https://your-project-name.vercel.app`

#### Deploy via Vercel CLI

1. **Install Vercel CLI**:

   ```bash
   npm i -g vercel
   ```

2. **Login to Vercel**:

   ```bash
   vercel login
   ```

3. **Deploy**:

   ```bash
   vercel
   ```

4. **Set Environment Variables**:

   ```bash
   vercel env add GEMINI_API_KEY
   vercel env add ELEVENLABS_API_KEY
   ```

5. **Redeploy with Environment Variables**:
   ```bash
   vercel --prod
   ```

### Local Development

1. **Install Dependencies**:

   ```bash
   pip install -r requirements.txt
   ```

2. **Set Environment Variables**:
   Copy `.env.example` to `.env` and fill in your API keys:

   ```bash
   cp .env.example .env
   ```

3. **Run the Application**:
   ```bash
   python app.py
   ```

## Project Structure

```
studysauce-podcast-generator/
├── api/
│   └── index.py          # Main Flask application (Vercel entry point)
├── app.py                # Local development entry point
├── requirements.txt      # Python dependencies
├── vercel.json          # Vercel configuration
├── .env.example         # Environment variables template
└── README.md            # This file
```

## Configuration Files

### vercel.json

Configures Vercel to:

- Use Python runtime for the Flask app
- Route all requests to the Flask application
- Set function timeout to 300 seconds for audio processing

### API Structure

The application uses `/tmp` directories in the serverless environment for temporary file storage during processing.

## API Endpoints

- `GET /` - Main application interface
- `POST /upload` - Upload PDF and start processing
- `GET /status/<task_id>` - Check processing status
- `GET /download/<filename>` - Download generated podcast

## Notes

- Maximum file size: 16MB
- Podcast length: 3-15 minutes
- Supports 1-4 hosts and 0-3 guests
- Audio format: MP3
- Processing time varies based on PDF size and podcast length

## Troubleshooting

1. **API Key Issues**: Ensure environment variables are properly set in Vercel
2. **File Size**: PDFs must be under 16MB
3. **Timeout**: Large files may take several minutes to process
4. **Audio Quality**: ElevenLabs API quality depends on your subscription tier

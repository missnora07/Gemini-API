# Gemini-API

Gemini-API is a Node.js-based API utilizing the power of @google/generative-ai. This API is designed to address issues in countries where the original functionality might not be working.

## Setup

### Prerequisites

Make sure you have Node.js installed. If not, you can download it [here](https://nodejs.org/).

### Installation

1. Clone this repository:

```bash
git clone https://github.com/missnora07/Gemini-API.git
```

2. Navigate to the project folder:

```bash
cd Gemini-API
```

3. Install the required packages:

```bash
npm install axios express @google/generative-ai body-parser
```

## Usage

1. Run the API:

```bash
npm start
```

2. The API will be available at `http://localhost:3000`.

3. Integrate the API into your project to leverage the generative capabilities provided by @google/generative-ai.

## Endpoints

### Gemini Pro (GET)

```plaintext
http://localhost:3000/gemini?prompt=Hello&api_key=your_key
```

### Gemini Vision (POST)

```javascript
const axios = require('axios');
const fs = require('fs').promises;
const apiUrl = "http://localhost:3000/";
const prompt = "Hello";
const filePath = "./image.jpeg";
const mimeType = "image/jpeg";
const api_key = "your_key";

(async () => {
  try {
    const imageData = await fs.readFile(filePath);
    const base64Image = imageData.toString('base64');

    const requestData = {
      image: base64Image,
      prompt: prompt,
      mime_type: mimeType,
    };

    const response = await axios.post(apiUrl + 'gemini-vision', requestData, {
      headers: {
        'Content-Type': 'application/json',
        'api_key': api_key,
      },
    });

    console.log(response.data.text || "_Server down, Try again later_");
  } catch (error) {
    return console.error(error.response ? error.response.data : error.message);
  }
})();
```


Make sure to replace `your_key` with your actual API key.

(Currently only one image can process)

## Contributors

- Amruth

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE.txt) file for details.

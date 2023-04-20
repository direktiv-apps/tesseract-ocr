
# tesseract-ocr 1.0

Run Tesseract OCR in Direktiv

---
- #### Categories: unknown
- #### Image: gcr.io/direktiv/functions/tesseract-ocr 
- #### License: [Apache-2.0](https://www.apache.org/licenses/LICENSE-2.0)
- #### Issue Tracking: https://github.com/direktiv-apps/tesseract-ocr/issues
- #### URL: https://github.com/direktiv-apps/tesseract-ocr
- #### Maintainer: [direktiv.io](https://www.direktiv.io) 
---

## About tesseract-ocr

This package contains an OCR engine - libtesseract and a command line program - [tesseract](https://github.com/tesseract-ocr/tesseract).

Tesseract 4 adds a new neural net (LSTM) based OCR engine which is focused on line recognition, but also still supports the legacy Tesseract OCR engine of Tesseract 3 which works by recognizing character patterns. Compatibility with Tesseract 3 is enabled by using the Legacy OCR Engine mode (--oem 0). It also needs traineddata files which support the legacy engine, for example those from the tessdata repository.

Basic usage: `tesseract imagename outputbase [-l lang] [--oem ocrenginemode] [--psm pagesegmode] [configfiles...]`

Use `--oem 1` for LSTM/neural network, `--oem 0` for Legacy Tesseract.

Please note that Legacy Tesseract models are included in traineddata files from tessdata repo only.

`tesseract input.tiff output --oem 1 -l eng`

Tesseract has unicode (UTF-8) support, and can recognize more than 100 languages "out of the box". Tesseract supports various image formats including PNG, JPEG and TIFF. Tesseract supports various output formats: plain text, hOCR (HTML), PDF, invisible-text-only PDF, TSV and ALTO (the last one - since version 4.1.0). You should note that in many cases, in order to get better OCR results, you'll need to improve the quality of the image you are giving Tesseract.

### Example(s)
  #### Function Configuration
```yaml
functions:
- id: tesseract-ocr
  image: gcr.io/direktiv/functions/tesseract-ocr:1.0
  type: knative-workflow
```
   #### Print the version installed for tessaract
```yaml
- id: tesseract-ocr
  type: action
  action:
    function: tesseract-ocr
    input: 
      commands:
      - command: tesseract --version
```
   #### Basic image conversion from a file in a variable, written to a local Direktiv variable
```yaml
- id: tesseract-ocr
  type: action
  action:
    function: tesseract-ocr
    files:
    - key: image.png
      scope: workflow
    input:
      commands:
      - command: tesseract image.png out/workflow/text
```
   #### Searchable pdf output, written to a local Direktiv variable
```yaml
- id: tesseract-ocr
  type: action
  action:
    function: tesseract-ocr
    files:
    - key: eurotext.png
      scope: workflow
    input:
      commands:
      - command: tesseract eurotext.png /out/workflow/eurotext-eng -l eng pdf
```

   ### Secrets


*No secrets required*







### Request



#### Request Attributes
[PostParamsBody](#post-params-body)

### Response
  List of executed commands.
#### Reponse Types
    
  

[PostOKBody](#post-o-k-body)
#### Example Reponses
    
```json
[
  {
    "result": "tesseract 4.1.1\n leptonica-1.82.0\n  libgif 5.1.9 : libjpeg 8d (libjpeg-turbo 2.1.1) : libpng 1.6.37 : libtiff 4.3.0 : zlib 1.2.11 : libwebp 1.2.2 : libopenjp2 2.4.0\n Found libarchive 3.6.0 zlib/1.2.11 liblzma/5.2.5 bz2lib/1.0.8 liblz4/1.9.3 libzstd/1.4.8",
    "success": true
  }
]
```

### Errors
| Type | Description
|------|---------|
| io.direktiv.command.error | Command execution failed |
| io.direktiv.output.error | Template error for output generation of the service |
| io.direktiv.ri.error | Can not create information object from request |


### Types
#### <span id="post-o-k-body"></span> postOKBody

  



**Properties**

| Name | Type | Go type | Required | Default | Description | Example |
|------|------|---------|:--------:| ------- |-------------|---------|
| tesseract-ocr | [][PostOKBodyTesseractOcrItems](#post-o-k-body-tesseract-ocr-items)| `[]*PostOKBodyTesseractOcrItems` |  | |  |  |


#### <span id="post-o-k-body-tesseract-ocr-items"></span> postOKBodyTesseractOcrItems

  



**Properties**

| Name | Type | Go type | Required | Default | Description | Example |
|------|------|---------|:--------:| ------- |-------------|---------|
| result | [interface{}](#interface)| `interface{}` | ✓ | |  |  |
| success | boolean| `bool` | ✓ | |  |  |


#### <span id="post-params-body"></span> postParamsBody

  



**Properties**

| Name | Type | Go type | Required | Default | Description | Example |
|------|------|---------|:--------:| ------- |-------------|---------|
| commands | [][PostParamsBodyCommandsItems](#post-params-body-commands-items)| `[]*PostParamsBodyCommandsItems` |  | `[{"command":"echo Hello"}]`| Array of commands. |  |
| files | [][DirektivFile](#direktiv-file)| `[]apps.DirektivFile` |  | | File to create before running commands. |  |


#### <span id="post-params-body-commands-items"></span> postParamsBodyCommandsItems

  



**Properties**

| Name | Type | Go type | Required | Default | Description | Example |
|------|------|---------|:--------:| ------- |-------------|---------|
| command | string| `string` |  | | Command to run |  |
| continue | boolean| `bool` |  | | Stops excecution if command fails, otherwise proceeds with next command |  |
| print | boolean| `bool` |  | `true`| If set to false the command will not print the full command with arguments to logs. |  |
| silent | boolean| `bool` |  | | If set to false the command will not print output to logs. |  |

 

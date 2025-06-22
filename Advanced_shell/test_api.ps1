# Test script for API automation

$API_URL = "https://pokeapi.co/api/v2/pokemon/pikachu"
$DATA_FILE = "data.json"
$ERROR_FILE = "errors.txt"

Write-Host "Testing API request to Pokémon API for Pikachu data..."

try {
    # Make the API request
    $response = Invoke-WebRequest -Uri $API_URL -ErrorAction Stop
    $response.Content | Out-File -FilePath $DATA_FILE -Encoding UTF8
    Write-Host "Success! Pikachu data saved to $DATA_FILE"
    Write-Host "Response status: $($response.StatusCode)"
} catch {
    Write-Host "Error: Failed to fetch data from API"
    $errorMessage = "Error: Failed to fetch data from API`n"
    $errorMessage += "Timestamp: $(Get-Date)`n"
    $errorMessage += "API URL: $API_URL`n"
    $errorMessage += "Error: $($_.Exception.Message)`n"
    $errorMessage | Out-File -FilePath $ERROR_FILE -Append -Encoding UTF8
    exit 1
}

Write-Host "Script completed successfully!" 
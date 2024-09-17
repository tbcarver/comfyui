#!/bin/bash

if [ -z "$HF_TOKEN" ]; then
    echo "HF_TOKEN is not set. Please enter your Hugging Face token:"
    read -r token
    export HF_TOKEN=$token
    echo "HF_TOKEN has been set."
else
    echo "HF_TOKEN is set."
fi

if [ -z "$CIVITAI_TOKEN" ]; then
    echo "Civitai API token is not set. Please enter your Civitai token:"
    read -r token
    export CIVITAI_TOKEN=$token
    echo "CIVITAI_TOKEN has been set."
else
    echo "CIVITAI_TOKEN is set."
fi

function get_model {
    local model_url=$1
    local output_path=$2
    
    if [ ! -f "$output_path" ]; then
        wget --header="Authorization: Bearer $HF_TOKEN" -O "$output_path" "$model_url"
        echo "Downloaded $output_path"
    else
        echo "$output_path already exists."
    fi
}

function get_zipped {
    local model_url=$1
    local output_path=$2
    local unzip_path=$3
    
    if [ ! -f "$unzip_path" ]; then
        curl -L -H "Authorization: Bearer $CIVITAI_TOKEN" "$model_url" -o "$output_path"
        unzip "$output_path" -d "$unzip_path"
        rm "$output_path"
        echo "Downloaded and extracted $output_path"
    else
        echo "$unzip_path already exists."
    fi
}

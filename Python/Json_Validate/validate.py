import json
import os


def validate_json(file_path):
    # Check if the file exists
    if not os.path.exists(file_path):
        print(f"Error: {file_path} does not exist.")
        return False

    # Try to open and load the JSON file
    try:
        with open(file_path, "r") as file:
            data = json.load(file)
            # Example check: Ensure the JSON contains a list of operators (adjust based on your data)
            if isinstance(data, list) and all(isinstance(op, dict) for op in data):
                print("JSON file is valid.")
                return True
            else:
                print("Error: JSON structure is invalid.")
                return False
    except json.JSONDecodeError:
        print("Error: Failed to decode JSON.")
        return False


# Example usage
file_path = "path/to/your/operators.json"
is_valid = validate_json(file_path)

if not is_valid:
    print("The JSON file is invalid.")
else:
    print("The JSON file is valid.")

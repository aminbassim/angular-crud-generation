#!/bin/bash

# Entities array
entities=("order" "permission" "user" "role")

# proyect path
base_path="src/app/features"

# Loop for every entity
for entity in "${entities[@]}"; do
  echo "Generating CRUD for: $entity"

  # Create folders
  mkdir -p $base_path/$entity/models
  mkdir -p $base_path/$entity/services
  mkdir -p $base_path/$entity/pages/${entity}-list
  mkdir -p $base_path/$entity/pages/${entity}-create
  mkdir -p $base_path/$entity/pages/${entity}-edit

  # Create models
  touch $base_path/$entity/models/${entity}.model.ts
  echo "export class ${entity^} {}" > $base_path/$entity/models/${entity}.model.ts
  echo "Model created for $entity."

  # Create services using angular cli
  ng generate service features/$entity/services/$entity
  echo "Service created for $entity."

  # Create components using Angular CLI
  ng generate component features/$entity/pages/${entity}-list
  ng generate component features/$entity/pages/${entity}-create
  ng generate component features/$entity/pages/${entity}-edit
  echo "Components created for $entity."

  # Crear routes files
  touch $base_path/$entity/${entity}.routes.ts
  echo "Routes file created for $entity (empty)."
done

echo "All entities generated successfully!"

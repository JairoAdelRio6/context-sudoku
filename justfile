module_name := "sudoku"
zip_file := f"t-{{module_name}}.zip" 
tex_module_file := f"t-{{module_name}}.mklx"
tex_doc_file := f"t-{{module_name}}.pdf"
mp_module_file := f"meta-imp-{{module_name}}.mkxl"
mplua_module_file := f"meta-imp-{{module_name}}.lmt"
temp_folder := "temp"
tex_folder := f"{{temp_folder}}/tex/context/third/{{module_name}}"
doc_folder := f"{{temp_folder}}/doc/context/third/{{module_name}}"

build:
  -rm *.pdf "{{zip_file}}"
  mkdir -p "{{tex_folder}}"
  mkdir -p "{{doc_folder}}"
  context "{{tex_module_file}}"
  mtxrun --script context --purgeall
  cp "LICENSE" "VERSION" "CHANGELOG.md" "README.md" "{{temp_folder}}"
  cp "{{tex_module_file}}" "{{mp_module_file}}" "{{mplua_module_file}}" "{{tex_folder}}"
  cp "t-sudoku-test-01.txt" "t-sudoku-test-02.txt" "t-sudoku-test-03.txt" "{{doc_folder}}"
  mv "{{tex_doc_file}}" "{{doc_folder}}"
  cd "{{temp_folder}}" && zip -r "../{{zip_file}}" .
  rm -rf "{{temp_folder}}"

# cd with fzf
cdf() {
  current_dir=$(pwd)

  if [ $# -gt 0 ];then
    if [ ! -d "$1" ]; then
      echo "No such directory: $1"
      return 1
    fi
    current_dir=$1
  fi

  target_dir=$(find "$current_dir" -name "*" -type "d" 2>/dev/null | grep -v "\.git" | fzf)

  if [ -n "$target_dir" ]; then
    cd $target_dir
  fi
}

# pandoc alias
pan() {
  if [ $# -gt 0 ]; then
    echo "No select file"
    return 1
  fi

  target_file="$1"

  if [ ! -f "$target_file" ]; then
    echo "No such file: $target_file"
    return 1
  fi

  if [ ! -n "$2" ]; then
    echo "No output filename"
    return 1
  fi
  output_file="$2"

  pandoc ${target_file} -o ${output_file} --pdf-engine=lualatex -V documentclass=bxjsarticle -V classoption=pandoc
}

tef() {
  target_file=$1

  if [ ! -e "${target_file}" ]; then
      echo "'${target_file}' is not exist."
      exit 1
  fi

  if [[ ! ${target_file} =~ .+\.tex ]]; then
      echo "'${target_file}' is not tex file."
      exit 1
  fi

  non_extension_file=${target_file%\.tex}

  # latexmk ${target_file}
  platex "${target_file}"

  if [ -e "${non_extension_file}.dvi" ]; then
      dvipdfmx "${non_extension_file}.dvi"
  fi
  wait

  if [ -e "${non_extension_file}.aux" ]; then
      rm "${non_extension_file}.aux"
  fi

  if [ -e "${non_extension_file}.dvi" ]; then
      rm "${non_extension_file}.dvi"
  fi

  if [ -e "${non_extension_file}.fdb_latexmk" ]; then
      rm "${non_extension_file}.fdb_latexmk"
  fi

  if [ -e "${non_extension_file}.fls" ]; then
      rm "${non_extension_file}.fls"
  fi

  if [ -e "${non_extension_file}.log" ]; then
      rm "${non_extension_file}.log"
  fi

  if [ -e "${non_extension_file}.synctex.gz" ]; then
      rm "${non_extension_file}.synctex.gz"
  fi

  if [ -e "${non_extension_file}.nav" ]; then
      rm "${non_extension_file}.nav"
  fi

  if [ -e "${non_extension_file}.out" ]; then
      rm "${non_extension_file}.out"
  fi

  if [ -e "${non_extension_file}.snm" ]; then
      rm "${non_extension_file}.snm"
  fi

  if [ -e "${non_extension_file}.toc" ]; then
      rm "${non_extension_file}.toc"
  fi
}

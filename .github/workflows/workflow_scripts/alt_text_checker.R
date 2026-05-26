get_file_content <- function(file_name){
  
  # Try fetching the content
  tryCatch({
    # Read the file using readLines()
    file_content <- readLines(file_name)
  })
  
  return(file_content)
  
}

check_all_have_alt_text <- function(v) {
  if(length(v) >4){
    boolean_1 <- v == "a"
    boolean_2 <- v == "a" &
      v[-1] == "b" &
      v[-c(1:2)] == "c" &
      v[-c(1:3)] == "d" &
      v[-c(1:4)] == "e"
    result <- identical(boolean_1,boolean_2)
  }
  else{
    if ("a" %in% v){
      result <- FALSE
    }else{
      result <- TRUE
    }
  }
  return(result)
}


check_line_for_alt_text <- function(line){
  
  exclamation_open_bracket_loc <- gregexpr("\\!+(\\s*\\[|\\[)",line)[[1]]
  string_dataframe <- data.frame(character = rep("a",length(exclamation_open_bracket_loc)),
                                 position = exclamation_open_bracket_loc)
  
  close_sq_bracket_open_rd_loc <- gregexpr("\\]+(\\s*\\(|\\()",line)[[1]]
  string_dataframe <- rbind(string_dataframe,
                            data.frame(character = rep("b",length(close_sq_bracket_open_rd_loc)),
                                       position = close_sq_bracket_open_rd_loc))
  
  close_rd_bracket_open_cly_loc <- gregexpr("\\)+(\\s*\\{|\\{)",line)[[1]]
  string_dataframe <- rbind(string_dataframe,
                            data.frame(character = rep("c",length(close_rd_bracket_open_cly_loc)),
                                       position = close_rd_bracket_open_cly_loc))
  
  alt_text_loc <- gregexpr("alt-text",line)[[1]]
  string_dataframe <- rbind(string_dataframe,
                            data.frame(character = rep("d",length(alt_text_loc)),
                                       position = alt_text_loc))
                            
  close_cly_bracket_loc <- gregexpr("\\}",line)[[1]]
  string_dataframe <- rbind(string_dataframe,
                            data.frame(character = rep("e",length(close_cly_bracket_loc)),
                                       position = close_cly_bracket_loc))
  
  
  string_dataframe <- string_dataframe |> dplyr::arrange(position) |> dplyr::filter(position != -1)
  
  
  string_vector <- string_dataframe$character
  
  return(check_all_have_alt_text(string_vector))
    
}

check_file_for_alt_text <- function(the_file){
  
  file_content <- get_file_content(the_file)
  
  errors <- c()
  for(line in 1:length(file_content)){
    if(!check_line_for_alt_text(file_content[line])){
      errors <- c(errors,line)
    }
  }
  return(errors)
}

check_project_for_alt_text <- function(){
  errors <- list()
  markdown_files <- list.files(pattern = "\\.qmd$", full.names = TRUE, recursive = TRUE)
  
  for(file in markdown_files){
    print(file)
    errors[[file]] <- check_file_for_alt_text(file)
  }
  print(errors)
}

check_project_for_alt_text()

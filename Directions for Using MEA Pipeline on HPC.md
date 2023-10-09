# Directions for Using MEA Pipeline on HPC

## 1. SSH into your remote server

```
ssh remote_username@remote_host
```

- **remote_username** and **remote_host** are specific to your remote SSH server

## 2. Download MEA pipeline directory to your remote server

There are **2 ways** to download the MEA pipeline directory to your remote server

1. Download the most recent version of the MEA pipeline directly from GitHub to your remote server

```
git clone [https://github.com/SAND-Lab/MEA-NAP.git](https://github.com/SAND-Lab/MEA-NAP.git)
```

- MEA pipeline directory will be called **MEA-NAP**
- MEA-NAP will be downloaded to your current directory
- The following lines should show up in your terminal:

1. Download pre-existing, local MEA pipeline directory to your remote SSH server 

```
rsync -rlug myDir/ remote_username@remote_host:/remote/directory
```

- **Open another terminal window that is not logged into your remote server to use this command**
- **myDir:** path of your local MEA pipeline directory
    - Include / at end of path
- **/remote/directory:** path of remote server directory where you want to copy your local directory
- After successfully running command, **switch back to terminal window that is logged into your remote SSH server**

Rename the MEA pipeline directory that you moved to the server to MEA-NAP

```
mv /remote/directory MEA-NAP
```

## 3. Change your current directory to the MEA pipeline directory

```
cd MEApipeline_directory
```

- **MEApipeline_directory:** path of the MEA pipeline directory located on your remote server

## 4. Create directory for mat files in your MEA-NAP directory

```
mkdir [mat_file_directory_name]
```

- **[mat_file_directory_name]**: name of directory that will be created to store your mat files

## 5. Download mat files to your local device

Note the locations of your downloaded mat files

## 6.  Move mat files to your remote SSH server

There are **3 ways** to move mat files: 

**For these methods, open another terminal window that is not logged into your remote server** 

1. Move one local mat file to the mat file directory you **created during step 4 (see above)**

```
scp -r mat_file remote_username@DEST_HOST:/path/to/[mat_file_directory_name]
```

- **mat_file:**  path of a mat file on your local device
- **/path/to/[mat_file_directory_name]:** path of the directory where you want to store your mat files

1. Move multiple local mat files to the mat file directory **created during step 4 (see above)**

```
scp mat_file1 mat_file2 mat_file3 ... remote_username@remote_host:/path/to/[mat_file_directory_name]
```

- **mat_file1 mat_file2 mat_file3 …** : paths of mat files on your local device
    - The mat file paths should be separated by spaces
    - Do not include …
- **path/to/[mat_file_directory_name]:** path of directory where you want to store your .mat files
- Check current directory with the following command

Move all mat files located in a local directory to remote server directory 

```
scp -r myDir remote_username@remote_host:/path/to/[mat_file_directory_name]
```

- **myDir**: path of directory that contains the mat files you plan to analyze
- **path/to/[mat_file_directory_name]:** path of directory where you want to store your .mat files

## 7. On your local device, create csv files(s) for mat files that you plan to analzyze

Example csv file: 

![Screen Shot 2023-06-27 at 8.10.29 AM.png](Directions%20for%20Using%20MEA%20Pipeline%20on%20HPC%20e24ca2005aa54ea79654ea119499294b/Screen_Shot_2023-06-27_at_8.10.29_AM.png)

- Use this link for more detailed documentation on csv formatting: [https://analysis-pipeline.readthedocs.io/en/latest/pipeline-steps.html#table-with-your-data-filenames-for-batch-analysis-with-age-and-group-identifiers](https://analysis-pipeline.readthedocs.io/en/latest/pipeline-steps.html#table-with-your-data-filenames-for-batch-analysis-with-age-and-group-identifiers)

## 8. Move csv file(s) to remote SSH server directory

**3 ways** to move mat files are the following: 

**For these methods, open another terminal window that is not logged into your remote server** 

Move single csv file to MEA pipeline directory on SSH server

```
scp csv_file remote_username@remote_host:/path/to/MEApipeline_directory
```

- **csv_file:** path of csv file
- **/path/to/MEApipeline_directory:** path of MEA pipeline directory on remote server

Move multiple csv files to remote directory on SSH server 

```
scp csv_file1 csv_file2 csv_file3 ... remote_username@remote_host:/path/to/MEApipeline_directory
```

- **csv_file1 csv_file2 csv_file3 ... :** paths of csv files that you want to copy to remote directory on SSH server
    - The csv file paths should be separated by spaces
    - Do not include …
- **/path/to/MEApipeline_directory:** path of MEA pipeline directory on remote server

Move all csv files located in a local directory to remote server directory 

```
scp -r csv_file_directory remote_username@remote_host:/path/to/MEApipeline_directory
```

- **csv_file_directory**: path of directory that contains csv_files
- **/path/to/MEApipeline_directory:** path of MEA pipeline directory on remote server

## 9.  Download modified MEApipeline.m

Link to version of MEApipeline.m designed for remote SSH servers: [https://github.com/SAND-Lab/Supercloud-David/blob/main/MEApipeline.m](https://github.com/SAND-Lab/Supercloud-David/blob/main/MEApipeline.m) 

- Removes sections of MEApipeline.m that require GUI

## 10. Edit MEAPipeline.m

Edit MEApipeline.m according to this documentation: [https://analysis-pipeline.readthedocs.io/en/latest/pipeline-steps.html](https://analysis-pipeline.readthedocs.io/en/latest/pipeline-steps.html)

3 **ways** to edit MEApipeline.m are the following: 

1. Make changes to MEApipeline.m with edit command 

```
scp /path/to/local_MEApipeline.m remote_username@remote_host:path/to/MEApipeline_directory
ssh remote_username@remote_host
edit /path/to/remote_MEApipeline.m 
```

- **/path/to/local_MEApipeline.m**: path to MEApipeline.m on your local device
    - Will be located in your MEA pipeline directory
- **/path/to/remote_MEApipeline.m:** path to MEApipeline.m on your remote server

1. Make changes to MEApipeline.m with nano command 

```
scp /path/to/local_MEApipeline.m remote_username@remote_host:path/to/MEApipeline_directory
ssh remote_username@remote_host
nano /path/to/remote_MEApipeline.m 
```

- **/path/to/local_MEApipeline.m**: path to MEApipeline.m on your local device
    - Will be located in your MEA pipeline directory
- **/path/to/remote_MEApipeline.m:** path to MEApipeline.m on your remote server
    
    
1. Edit MEApipeline.m on your local device first and move it to your remote MEA pipeline directory with this command 

```
scp /path/to/MEApipeline.m remote_username@remote_host:path/to/MEApipeline_directory
```

- **/path/to/MEApipeline.m**: path of MEApipeline.m on your local device
- **/path/to/MEApipeline_directory:** path of the MEA pipeline directory on your remote server

## 10. Download and move modified CreateOutputFolders.m to your remote server

Link to version of CreateOutputFolders.m modified for remote SSH servers: [https://github.com/SAND-Lab/Supercloud-David/blob/main/Functions/CreateOutputFolders.m](https://github.com/SAND-Lab/Supercloud-David/blob/main/Functions/CreateOutputFolders.m)

```
scp /path/to/CreateOutputFolders.m remote_username@remote_host:path/to/MEApipeline_directory/Functions
```

- /path/to/CreateOutputFolders.m: path of CreateOutputFolders.m on your local device
- path/to/MEApipeline_directory/Functions: path of Functions subdirectory in the MEA pipeline directory on your remote server

## 11. Create bash script to submit jobs for MEA pipeline

Check available MATLAB modules on your server

```
module avail matlab
```

- Note the MATLAB module that you want to use

If not available, check available R modules on your server 

```
module avail R 
```

- Note the R module that you want to use

Get full path of your MEA pipeline directory 

- Useful commands
    
    Get current directory 
    
    ```
    pwd
    ```
    
    Change directory 
    
    ```
    cd newDir
    ```
    
    - **newDir:** path of directory that you want to make current directory
    - Press tab to autocomplete directory paths if possible

Create new bash script 

```
nano [bash_script_name]
```

- **[bash_script_name]**: name of bash script
    - must end with .sh

Example bash script: 

```
#!/bin/bash
#SBATCH -n 4
#SBATCH -N 1
#SBATCH -o MEApipeline.sh.log-%j 

cd /path/to/MEApipeline_directory

# Load the module
module load [module_name] 

# Run MATLAB script
matlab -nodisplay -nosplash -r "run('MEApipeline.m'); exit;"
```

- **/path/to/MEApipeline_directory**: path of MEA pipeline directory
    - **cd /path/to/MEApipeline_directory a**llows remote server to easily access files necessary for running MEA pipeline script (MEApipeline.m)
- **#SBATCH -o MEApipeline.sh.log-%j** : include this line in your bash script to save log files that can be distinguished by their job ID **(recommended)**
    - Log files are useful for viewing progress and error messages related to the MEApipeline.m
- **[module_name]**: name of MATLAB or R module that you noted down during first part of this step
- **matlab -nodisplay -nosplash -r "run('MEApipeline.m'); exit;":** automatically runs MEApipeline.m once job is submitted

## 12. Submit job with your bash script

```
sbatch bash_script
```

- **bash_script:** full path of bash script that you want to submit job with
- Job ID (number) should appear on your screen

## 13. Check log files to view progress and error messages associated with MEApipeline.m

```
nano log_file
```

- **log_file:** path of the log file that you want to look at
    - If you included **#SBATCH -o MEApipeline.sh.log-%j**  in your bash script, job ID can be used to locate the relevant log file
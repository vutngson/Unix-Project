#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <dirent.h>

#define MAX_LENGTH 1024
#define DELIMS " \t\r\n"

int main(int argc, char *argv[]) { 
  	char *cmd, *data;
  	char line[MAX_LENGTH];

    while (1) {	//waiting for an input from keyboard
	printf("Please enter your command: ");
   	if (!fgets(line, MAX_LENGTH, stdin)) //check command
	break;

    	// Parse and execute command
    	if ((cmd = strtok(line, DELIMS))) {

		
		if (strcmp(cmd,"mkdir") == 0) {	//mkdir command
			data = strtok(0, DELIMS);		
			if (data == NULL)	
				printf("mkdir missing operand.\n");	
			else{
				int check = mkdir(data, 0777); 
				if (check != '\0')
					printf("Folder exists!\n");
				else printf("Folder has been created!\n");
			}
		}
		
		else if (strcmp(cmd,"rmdir") == 0) {	//rmdir command
			data = strtok(0, DELIMS);
			if (data == NULL)
				printf("rmdir missing operand.\n");
			else{
				int check = rmdir(data);
				if (check != '\0')
					printf("There is no such folder !\n");
				else printf("Folder has been removed!\n");
			}
		} 


		else if (strcmp(cmd, "cd") == 0) {	//cd command
			char *arg = strtok(0, DELIMS);
			if (!arg) fprintf(stderr, "cd missing argument.\n"); //khong nhap vao gi => hien thong bao
			else chdir(arg);
		}


		else if (strcmp(cmd,"ls")==0) {	//ls command
		char s[20][2000], t[2000];
		char dirname[100] = ".";
		int q = 0, k, j, i;
		DIR*p;
		struct dirent *d;

		p=opendir(dirname);				
			if(p==NULL) {
				perror("Cannot find directory");
				exit(-1);
			}	

			while(d=readdir(p)){
				strcpy(s[q],d->d_name);
				q++;
			}
			if (q == 2)
				printf("<Empty folder>\n");
				else{		 
					for(i=1;i<q;i++){
						for(j=1;j<q;j++){
							if(strcmp(s[j-1],s[j])>0){
		    					strcpy(t,s[j-1]);
		    					strcpy(s[j-1],s[j]);
		    					strcpy(s[j],t);
				   			}
						}
					}

					for(k=0;k<q;k++){
						if ((strcmp(s[k],".") != 0) && (strcmp(s[k],"..") != 0)){
							printf(s[k],strlen(s[k]),0);
							printf("\n");
						}
					}		
				}
			}
 		
		
		else if (strcmp(cmd, "exit") == 0) // exit command
		break;

	      	else {	//no command found
			printf ("no command found\n");
		}

	}
	
    }

  	return 0;
}

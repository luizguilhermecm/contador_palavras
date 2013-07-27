#include <iostream>
#include <fstream>
#include <string>
#include <cstring>
#include <vector>

using namespace std;

vector<string> dicionario;
vector<string> ordem;
vector<int> maior;
vector<int> repeat;
int contador (string palavra)
{
        if (dicionario.empty()){
                dicionario.push_back(palavra); 
                repeat.push_back(1); 
        }
        else{
                int size = dicionario.size();
                for (int i = 0; i < size; i++){
                        if (dicionario[i] == palavra){
                                repeat[i]++;
                                return 0;
                        }
                }
                dicionario.push_back(palavra);
                repeat.push_back(1);
                return 0;
        }

}

int getMax (){
        int max = 0;
        int j = -1;
        for (int i = 0; i < repeat.size(); i++){
                if (repeat[i] > max){ 
                        max = repeat[i];
                        j = i;
                }
        }
        repeat[j] = 0;
        if(j != -1){
                maior.push_back(max);
                ordem.push_back(dicionario[j]);
                getMax();
        }
        return 0;
}

int main(int argc, char *argv[])
{
        if(argv[1] == NULL){
                cout << "passe um arquivo como argumento" << endl;
                cout << "./contador arquivo.txt" << endl;
                return 0;
        }
        ifstream fin (argv[1]); //nome do arquivo
        char fdl; //caracter para verificar se é fim de linha        
        string palavra;

        while (fin.get(fdl)){
                if (fdl != '\n') palavra.push_back(fdl);
                else {
                        contador(palavra);
                        palavra.clear();
                }
        }

        getMax();
       
        int size = maior.size();
        for (int i = 0; i < size; i++){
                cout << maior[i] << " = " << ordem[i] << endl;
        }

        return 0;

}

import os
import shutil

cartella = os.getcwd()

for nome_file in os.listdir(cartella):
    percorso_completo = os.path.join(cartella, nome_file)
    
    if os.path.isfile(percorso_completo):
        nome, estensione = os.path.splitext(nome_file)
        
        # Evita file già modificati
        if not nome.endswith("_A"):
            nuovo_nome = f"{nome}_A{estensione}"
            nuovo_percorso = os.path.join(cartella, nuovo_nome)
            
            shutil.copy2(percorso_completo, nuovo_percorso)

print("Copia completata.")
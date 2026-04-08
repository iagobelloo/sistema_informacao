#Organizador de pasta
import os
import shutil

# Encontra a pasta de Downloads
usuario = os.path.expanduser("~")
pasta_downloads = os.path.join(usuario, "Downloads")

# Pastas e subpastas
MAPA_ORGANIZACAO = {
    # Documentos e Subcategorias
    ".pdf": "Documentos/PDF",
    ".docx": "Documentos/Word",
    ".doc": "Documentos/Word",
    ".txt": "Documentos/Word",
    ".xlsx": "Documentos/Excel",
    ".xls": "Documentos/Excel",
    ".csv": "Documentos/Excel",
    ".accdb": "Documentos/Excel",
    ".pptx": "Documentos/PowerPoint",
    
    # Mídia
    ".jpg": "Imagens",
    ".jpeg": "Imagens",
    ".png": "Imagens",
    ".gif": "Imagens",
    ".mp4": "Videos",
    ".mkv": "Videos",
    ".mp3": "Musicas",
    
    # Outros
    ".zip": "Arquivos_Compactados",
    ".rar": "Arquivos_Compactados",
    ".exe": "Instaladores",
    ".msi": "Instaladores"
}

def organizar_downloads():
    # Verifica se a pasta Downloads existe
    if not os.path.exists(pasta_downloads):
        print(f"Erro: A pasta {pasta_downloads} não foi encontrada.")
        return
        
    # Muda o diretório de trabalho para Downloads
    os.chdir(pasta_downloads)
    
    # Contador de arquivos
    arquivos_movidos = 0

    print(f"--- Iniciando a faxina em: {pasta_downloads} ---")
   
    for arquivo in os.listdir():
        # Pula se for uma pasta ou se for o próprio script .py
        if os.path.isdir(arquivo) or arquivo.endswith(".py"):
            continue

        # Isola a extensão do arquivo e coloca em letras minúsculas
        extensao = os.path.splitext(arquivo)[1].lower()

        # Verifica se está no nosso dicionário
        if extensao in MAPA_ORGANIZACAO:
            caminho_destino = MAPA_ORGANIZACAO[extensao]
            
            # Cria a pasta/subpasta
            if not os.path.exists(caminho_destino):
                os.makedirs(caminho_destino, exist_ok=True)
            
            # Mover o arquivo para o destino
            try:
                shutil.move(arquivo, os.path.join(caminho_destino, arquivo))
                print(f"✅ Movi: {arquivo} -> {caminho_destino}")
                
                arquivos_movidos += 1
                
            except Exception as e:
                print(f"❌ Erro ao mover {arquivo}: {e}")

    # Relatório
    print("-" * 40)
    print(f"CONCLUÍDO! {arquivos_movidos} arquivos foram organizados.")
    print("-" * 40)

if __name__ == "__main__":
    organizar_downloads()
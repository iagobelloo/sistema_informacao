import requests
from bs4 import BeautifulSoup
import pandas as pd

# URL de busca
url = "https://lista.mercadolivre.com.br/iphone"
headers = {
    "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36"
}

def extrair_dados_v3():
    print("🚀 Iniciando rastreamento com novos seletores...")
    
    try:
        resposta = requests.get(url, headers=headers)
        sopa = BeautifulSoup(resposta.text, 'html.parser')
        
        lista_produtos = []

        # Localizamos os itens da lista
        itens = sopa.find_all("li", class_="ui-search-layout__item")
        print(f"🔎 Itens detectados: {len(itens)}")

        for item in itens:
            # SELETOR DE TÍTULO (Baseado no seu diagnóstico)
            titulo_tag = item.find("a", class_="poly-component__title")
            
            # 3. SELETOR DE PREÇO (Fração decimal)
            preco_tag = item.find("span", class_="andes-money-amount__fraction")

            if titulo_tag and preco_tag:
                nome = titulo_tag.text.strip()
                valor = preco_tag.text.strip()
                
                lista_produtos.append({
                    "Produto": nome, 
                    "Preço (R$)": valor
                })
                print(f"✅ Capturado: {nome[:50]}...")

        # 4. SALVAR NO EXCEL
        if lista_produtos:
            df = pd.DataFrame(lista_produtos)
            nome_arquivo = "resultado_iphone_2026.xlsx"
            df.to_excel(nome_arquivo, index=False)
            
            print("-" * 40)
            print(f"🎉 SUCESSO! {len(lista_produtos)} itens salvos em: {nome_arquivo}")
            print("-" * 40)
        else:
            print("❌ Ainda não encontrei os dados. Verifique se o preço está em uma tag diferente.")

    except Exception as e:
        print(f"❌ Erro: {e}")

if __name__ == "__main__":
    extrair_dados_v3()
# Configuração de Ambiente no CentOS 09 🐧

Este script automatiza a configuração de um ambiente de virtualização no CentOS 09. Ele atualiza o sistema, instala pacotes necessários e configura serviços como libvirt e NetworkManager.

## Pré-requisitos

- CentOS 09 instalado
- Permissões de sudo

## Como Executar

1. Abra um terminal no seu sistema CentOS 09.

2. Clone este repositório ou baixe o script `Atualiza_OS.sh`.

    ```bash
    git clone https://github.com/wmiyake/updata-os-ocp4.git
    ```

3. Navegue até o diretório onde o script está localizado.

    ```bash
    cd /(DIR UTILIZADO)
    ```

4. Torne o script executável.

    ```bash
    chmod +x Atualiza_OS.sh
    ```

5. Execute o script.

    ```bash
    ./Atualiza_OS.sh
    ```

6. Siga as instruções fornecidas pelo script e responda às solicitações, se houver.

## Passos Realizados pelo Script

1. Atualizações do sistema.
2. Instalação de pacotes essenciais.
3. Configuração do serviço `systemd-resolved`.
4. Instalação e configuração do `libvirt`.
5. Configuração do `NetworkManager`.
6. Instalação e configuração do `qemu-kvm`.
7. Habilitação do serviço `virtqemud.socket`.
8. Inicialização do serviço `virtqemud.socket`.
9. Habilitação do `crc-daemon.service`.
10. Inicialização do `crc-daemon.service`.
11. Configuração do `systemd-networkd`.
12. Inicialização do `systemd-networkd`.
13. Habilitação e inicialização do `virtstoraged`.

## Observações

- Em caso de erro durante a execução, você será solicitado a decidir se deseja continuar com os comandos restantes.

---

**Nota:** Este script foi testado no CentOS 09. Recomenda-se revisar e adaptar conforme necessário para atender às suas necessidades específicas.
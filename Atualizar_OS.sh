#!/bin/bash

# Contagem total de comandos
total_commands=16
# Inicializa a variável de contagem
completed_commands=0
# Variável para verificar se houve falha
error=false

# Função para executar um comando e atualizar a porcentagem
execute_command() {
    echo "Executando: $1"
    if $1; then
        completed_commands=$((completed_commands + 1))
        percentage=$((completed_commands * 100 / total_commands))
        echo "Porcentagem de execução: $percentage%"
    else
        echo "Erro: O comando falhou."
        error=true
    fi
}

# Lista de comandos a serem executados
commands=(
    "sudo dnf -y update"
    "sudo dnf -y upgrade"
    "sudo dnf install -y epel-release"
    "sudo dnf install -y libvirt"
    "sudo dnf install -y NetworkManager NetworkManager-libnm NetworkManager-tui"
    "sudo dnf install -y qemu-kvm libvirt-daemon"
    "sudo dnf install -y systemd-resolved"
    "sudo dnf install -y qemu-kvm libvirt-daemon libvirt-daemon-driver-qemu NetworkManager"
    "sudo dnf install -y qemu-kvm"
    "sudo dnf install -y systemd-networkd"
    "sudo systemctl preset systemd-resolved.service"
    "sudo systemctl enable systemd-resolved.service"
    "sudo systemctl start systemd-resolved.service"
    "sudo systemctl preset libvirtd"
    "sudo systemctl enable --now libvirtd"
    "sudo usermod -aG libvirt $(whoami)"
    "sudo systemctl restart NetworkManager"
    "sudo systemctl preset virtqemud.socket"
    "sudo systemctl enable virtqemud.socket"
    "sudo systemctl start virtqemud.socket"
    "sudo systemctl preset systemd-networkd.service"
    "sudo systemctl enable systemd-networkd.service"
    "sudo systemctl start systemd-networkd.service"
    "sudo systemctl preset virtstoraged"
    "sudo systemctl enable virtstoraged"
    "sudo systemctl start virtstoraged"
    "sudo systemctl --user preset crc-daemon.service"
    "sudo systemctl --user enable crc-daemon.service"
    "sudo systemctl --user start crc-daemon.service"
    "systemctl status -n0 systemd-resolved.service"
    "systemctl status -n0 virtqemud.socket"
    "systemctl --user status -n0 crc-daemon.service"
    "systemctl status -n0 systemd-networkd.service"    
    "sudo systemctl status -n0 virtstoraged"
)

# Loop para executar os comandos
for cmd in "${commands[@]}"; do
    execute_command "$cmd"
    if $error; then
        read -p "Ocorreu um erro. Deseja continuar com os comandos restantes? (s/n) " choice
        case "$choice" in
            [nN])
                echo "Script interrompido."
                exit 1
                ;;
            *)
                echo "Continuando com os comandos restantes..."
                error=false
                ;;
        esac
    fi
done

echo "Script executado com sucesso."

#!/bin/bash

XORG_CONF_DIR="/etc/X11/xorg.conf.d"

install_xorg_input_lib() {
    echo "Verificando e instalando pacotes de entrada Xorg..."
    if [ -f /etc/os-release ] && grep -qi arch /etc/os-release; then
        sudo pacman -S --needed xf86-input-libinput xorg-xinput
    elif [ -f /etc/os-release ] && grep -qi ubuntu /etc/os-release; then
        sudo apt install -y xserver-xorg-input-libinput xinput
    else
        echo "Distribuição não suportada. Por favor, instale os pacotes necessários manualmente."
        exit 1
    fi
    echo "Pacotes de entrada Xorg verificados/instalados."
}

configure_touchpad() {
    echo "Configurando touchpad para tap-to-click com libinput..."

    if [ ! -d "$XORG_CONF_DIR" ]; then
        echo "Criando diretório: $XORG_CONF_DIR"
        sudo mkdir -p "$XORG_CONF_DIR"
    fi

    if [ -f "${XORG_CONF_DIR}/50-synaptics.conf" ]; then
        echo "Renomeando configuração existente do 50-synaptics.conf para backup."
        sudo mv "${XORG_CONF_DIR}/50-synaptics.conf" "${XORG_CONF_DIR}/50-synaptics.conf.bak"
    fi
    if [ -L "${XORG_CONF_DIR}/50-synaptics.conf" ]; then
        echo "Removendo symlink antigo 50-synaptics.conf."
        sudo rm "${XORG_CONF_DIR}/50-synaptics.conf"
    fi


    if [ -f "./40-libinput.conf" ]; then
        echo "Copiando 40-libinput.conf para ${XORG_CONF_DIR}/"
        sudo cp "./40-libinput.conf" "${XORG_CONF_DIR}/40-libinput.conf"
    else
        echo "ERRO: O arquivo '40-libinput.conf' não foi encontrado no diretório do script."
        echo "Por favor, crie-o na mesma pasta que setup.sh com as configurações do libinput."
        exit 1
    fi

    echo "Configuração do touchpad concluída. Será necessário reiniciar o X server (logout/login) para aplicar as mudanças."
}

install_xorg_input_lib
configure_touchpad

echo "Setup concluído. Lembre-se de reiniciar sua sessão gráfica (logout e login)."

// Array para armazenar pets favoritos
let favoritos = [];

// Função para adicionar/remover pets dos favoritos
function toggleFavorito(petCard) {
    const petInfo = petCard.innerHTML;

    if (favoritos.includes(petInfo)) {
        favoritos = favoritos.filter(item => item !== petInfo);
        petCard.querySelector('.favorito-btn').classList.remove('favoritado');
    } else {
        favoritos.push(petInfo);
        petCard.querySelector('.favorito-btn').classList.add('favoritado');
    }

    atualizarFavoritos();
}

// Função para atualizar a lista de favoritos na seção de favoritos
function atualizarFavoritos() {
    const listaFavoritos = document.getElementById('lista-favoritos');
    listaFavoritos.innerHTML = '';

    favoritos.forEach(favorito => {
        const div = document.createElement('div');
        div.className = 'pet-card';
        div.innerHTML = favorito;
        listaFavoritos.appendChild(div);
    });
}

// Adiciona evento de clique a todos os botões de favorito
document.querySelectorAll('.favorito-btn').forEach(btn => {
    btn.addEventListener('click', function() {
        const petCard = this.parentElement;
        toggleFavorito(petCard);
    });
 });

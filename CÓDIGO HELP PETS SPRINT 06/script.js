document.addEventListener('DOMContentLoaded', () => {
    const petCards = document.querySelectorAll('.pet-card');
    const modal = document.getElementById('petModal');
    const modalClose = document.querySelector('.close');
    const petImage = document.getElementById('petImage');
    const petName = document.getElementById('petName');
    const petDescription = document.getElementById('petDescription');
    const petRating = document.getElementById('petRating');
    const commentList = document.getElementById('commentList');
    const commentInput = document.getElementById('commentInput');
    const submitComment = document.getElementById('submitComment');

    petCards.forEach(card => {
        // Adicionar rótulo "Novo" se for um pet recém-adicionado
        const isNovo = card.getAttribute('data-novo') === 'true';
        if (isNovo) {
            const novoLabel = document.createElement('div');
            novoLabel.classList.add('pet-label', 'novo');
            novoLabel.innerText = 'Novo';
            card.appendChild(novoLabel);
        }

        // Adicionar ícone de espécie
        const especie = card.getAttribute('data-especie');
        let especieIcon = '';
        switch (especie) {
            case 'cachorro':
                especieIcon = '🐶';
                break;
            case 'gato':
                especieIcon = '🐱';
                break;
            case 'reptil':
                especieIcon = '🦎';
                break;
            // Adicione mais casos conforme necessário
        }
        const speciesElement = card.querySelector('.pet-species');
        speciesElement.innerText = especieIcon;

        card.addEventListener('click', () => {
            const foto = card.getAttribute('data-foto');
            const descricao = card.getAttribute('data-descricao');
            const avaliacao = card.getAttribute('data-avaliacao');

            petImage.src = foto;
            petName.innerText = card.querySelector('h3').innerText;
            petDescription.innerText = descricao;
            petRating.innerText = `Avaliação: ${avaliacao} estrelas`;

            // Limpar comentários antigos
            commentList.innerHTML = '';

            modal.style.display = 'block';
        });
    });

    modalClose.addEventListener('click', () => {
        modal.style.display = 'none';
    });

    window.addEventListener('click', (event) => {
        if (event.target == modal) {
            modal.style.display = 'none';
        }
    });

    submitComment.addEventListener('click', () => {
        const commentText = commentInput.value.trim();
        if (commentText !== '') {
            const newComment = document.createElement('li');
            newComment.innerText = commentText;
            commentList.appendChild(newComment);
            commentInput.value = '';
        }
    });
});

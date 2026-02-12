use strict;
use warnings;

# Lista de palavras
my @palavras = qw(
  computador
  programacao
  perl
  internet
  software
  teclado
  monitor
);

# Escolhe palavra aleatória
my $palavra = $palavras[ int(rand(@palavras)) ];
my @letras = split //, $palavra;

my @acertos = ('_') x length($palavra);
my %tentadas;
my $tentativas = 6;

print "🎮 JOGO: ADIVINHE A PALAVRA\n";

while ($tentativas > 0) {

    print "\nPalavra: ";
    print join(" ", @acertos);

    print "\nTentativas restantes: $tentativas";
    print "\nLetras usadas: " . join(", ", keys %tentadas);

    print "\nDigite uma letra: ";
    chomp(my $letra = <STDIN>);
    $letra = lc $letra;

    if ($letra !~ /^[a-z]$/) {
        print "Digite apenas UMA letra válida!\n";
        next;
    }

    if ($tentadas{$letra}) {
        print "Você já tentou essa letra!\n";
        next;
    }

    $tentadas{$letra} = 1;

    my $acertou = 0;
    for (my $i = 0; $i < @letras; $i++) {
        if ($letras[$i] eq $letra) {
            $acertos[$i] = $letra;
            $acertou = 1;
        }
    }

    if ($acertou) {
        print "✅ Boa! Letra correta.\n";
    } else {
        print "❌ Errou!\n";
        $tentativas--;
    }

    if (join("", @acertos) eq $palavra) {
        print "\n🎉 PARABÉNS! Você acertou a palavra: $palavra\n";
        exit;
    }
}

print "\n💀 GAME OVER! A palavra era: $palavra\n";

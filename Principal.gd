extends Node

export (PackedScene) var Inimigo
var score



func _ready():
	randomize()
	




func game_over():
	$pontuacaoTimer.stop()
	$inimigoTimer.stop()
	$HUD.exibir_gameover()
	$Musica.stop()
	$DeathSong.play()
	pass # Replace with function body.
func novo_jogo():
	score=0
	$player.start($posicaoInicial.position)
	$inicioTimer.start()
	$HUD.exibir_mensagem("Prepare-se")
	$HUD.atualiza_score(score)
	$Musica.play()

	pass


func _on_inicioTimer_timeout():
	$inimigoTimer.start()
	$pontuacaoTimer.start()
	pass # Replace with function body.


func _on_pontuacaoTimer_timeout():
	score+=1
	$HUD.atualiza_score(score)
	pass # Replace with function body.


func _on_inimigoTimer_timeout():
	$caminhoInimigo/spawnInimigo.offset=randi()
	var inimigo = Inimigo.instance()
	add_child(inimigo)
	var direcao=$caminhoInimigo/spawnInimigo.rotation + PI/2
	inimigo.position=$caminhoInimigo/spawnInimigo.position
	direcao+= rand_range(-PI / 4,PI / 4)
	inimigo.rotation=direcao
	inimigo.linear_velocity= Vector2(rand_range(inimigo.min_speed,inimigo.max_speed),0)
	inimigo.linear_velocity=inimigo.linear_velocity.rotated(direcao)
	pass # Replace with function body.

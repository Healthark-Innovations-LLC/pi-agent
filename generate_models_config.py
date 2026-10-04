import os
import json



def provider_template(name, baseUrl, models):
	return name, dict(
		baseUrl=baseUrl,
		api='openai-completions',
		apiKey='ollama',
		models=models,
	)


def model_template(
	name, 
	input=['text', 'image'], 
	reasoning=True, 
	contextWindow=20480, 
	maxTokens=16374,
):
	return dict(
		id=name,
		input=input,
		reasoning=reasoning,
		thinkingLevelMap=dict(off='off', minimal='minimal', low='low', medium='medium', high='high'),
		contextWindow=contextWindow,
		maxTokens=maxTokens,
	)


def build_models_config(providers):
	models_config = dict()
	models_config['providers'] = {x[0]: x[1] for x in providers} 
	return models_config


def write_models_config(config):
	with open('models.json', 'w') as file:
		file.write(json.dumps(config, indent=2))
	print(os.stat('models.json'))


def main():

	models = [
		model_template(name='igorls/gemma-4-12B-it-heretic-GGUF', contextWindow=20480, maxTokens=16374)
	]

	providers = (
		provider_template(name='ollama_gpu_5070fe_tailscale', baseUrl='http://100.84.90.51:11434/v1', models=models),
		provider_template(name='ollama_gpu_5070fe_local', baseUrl='http://192.168.111.175:11434/v1', models=models),
		provider_template(name='ollama_gpu_1080ti_tailscale', baseUrl='http://100.120.42.82:11434/v1', models=models),
		provider_template(name='ollama_mac', baseUrl='http://host.docker.internal:11434/v1', models=models),
		provider_template(name='ollama_docker', baseUrl='http://ollama:11434/v1', models=models),
		provider_template(name='ollama_localhost', baseUrl='http://localhost:11434/v1', models=models),
	)

	models_config = build_models_config(providers)

	write_models_config(models_config)

	print('OK')

	return models_config


if __name__ == "__main__":
	main()


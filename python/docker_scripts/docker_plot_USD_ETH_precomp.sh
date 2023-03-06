OUTPUTDIR=${PWD}/output_docker
DOCKERCMD="docker run -v ${OUTPUTDIR}:/app/output --rm acon2:v1"
ALGOUTPUTDIR=output_CR

# consensus sets visualization
$DOCKERCMD python3 plots/plot_ps.py --exp_name one_source_USD_ETH_UniswapV2_K_1_beta_0 --alg_output_root $ALGOUTPUTDIR --y_max_mc 0.05 --step 500 
$DOCKERCMD python3 plots/plot_ps.py --exp_name two_sources_USD_ETH_UniswapV2_coinbase_K_2_beta_1 --alg_output_root $ALGOUTPUTDIR --y_max_mc 0.05 --step 500
$DOCKERCMD python3 plots/plot_ps.py --exp_name three_sources_USD_ETH_UniswapV2_coinbase_binance_K_3_beta_1 --alg_output_root $ALGOUTPUTDIR --y_max_mc 0.05 --step 500

# consensus set size distribution
$DOCKERCMD python3 plots/plot_size.py --exp_names one_source_USD_ETH_UniswapV2_K_1_beta_0 two_sources_USD_ETH_UniswapV2_coinbase_K_2_beta_1 three_sources_USD_ETH_UniswapV2_coinbase_binance_K_3_beta_1 \
	--alg_output_root $ALGOUTPUTDIR --log_scale

# baselin consensus sets visualization
$DOCKERCMD python3 plots/plot_ps.py --exp_name three_sources_OneSigma_USD_ETH_UniswapV2_coinbase_binance_K_3_beta_1 --alg_output_root $ALGOUTPUTDIR --y_max_mc 0.05 --step 500 --ours_name '$\sigma$-ACon$^2$'


pts_p11 <- seq(from = -5, to = 5, length = 500)
pts_pz1 <- seq(from = -5, to = 5, length = 500)



shinyServer(function(input, output, session) {
  ## Evaluate probabilities and plot
  
  # 3 nests, each containing 3 categories
  # each nest contains a category and observations specific variable, price
  
  # instead of p_11, using pts_p11 to study effect of p_11
  # p_11 <- input$p_11
  
  # p_11 <- input$p_11
  # p_21 <- input$p_21
  # p_31 <- input$p_31
  # p_12 <- input$p_12
  # p_22 <- input$p_22
  # p_32 <- input$p_32
  # p_13 <- input$p_13
  # p_23 <- input$p_23
  # p_33 <- input$p_33
  # 
  # # bjm0 is the intercept for category j in nest m
  # # for each nest, one of the intercepts is zero
  # b_110 <- input$b_110
  # b_210 <- input$b_210
  # b_120 <- input$b_120
  # b_220 <- input$b_220
  # b_130 <- input$b_130
  # b_230 <- input$b_230
  # 
  # # bjm1 is the price coefficient for category j in nest m
  # b_111 <- input$b_111
  # b_211 <- input$b_211
  # b_311 <- input$b_311
  # b_121 <- input$b_121
  # b_221 <- input$b_221
  # b_321 <- input$b_321
  # b_131 <- input$b_131
  # b_231 <- input$b_231
  # b_331 <- input$b_331
  # 
  # 
  # # there is also a nest and individual-specific variable Z_im
  # z_1 <- input$z_1
  # z_2 <- input$z_2
  # z_3 <- input$z_3
  # 
  # # alpha_m0 is the intercept in the nest probability for nest m
  # # a_310 is set to zero for identification
  # a_10 <- input$a_10
  # a_20 <- input$a_20
  # 
  # # alpha_m1 is the coefficient of Z_im for nest m
  # a_11 <- input$a_11
  # a_21 <- input$a_21
  # a_31 <- input$a_31
  # 
  # # there is also a tau_m paramter for each nest m
  # tau_1 <- input$tau_1
  # tau_2 <- input$tau_2
  # tau_3 <- input$tau_3
  
  #ASSUMING ALL BETA PARAMETER INPUTS ARE ALREADY DIVIDED BY TAU, i.e. not beta star
  
  # # conditional item given nest probabilites
  # # vary with p_11 for nest 1
  # probs_j1condm1 <- exp(b_110 + b_111*pts_p11 )/(exp(b_110 + b_111*pts_p11 ) + exp(b_210 + b_211*p_21 ) + exp(b_310 + b_311*p_31 ))
  # probs_j2condm1 <- exp(b_210 + b_211*p_21 )/(exp(b_110 + b_111*pts_p11 ) + exp(b_210 + b_211*p_21 ) + exp(b_310 + b_311*p_31 ))
  # probs_j3condm1 <- exp(b_310 + b_311*p_31 )/(exp(b_110 + b_111*pts_p11 ) + exp(b_210 + b_211*p_21 ) + exp(b_310 + b_311*p_31 ))
  # 
  # # constant with respect to p_11 for nests 2 and 3
  # probs_j1condm2 <- exp(b_120 + b_121*p_12 )/(exp(b_120 + b_121*p_12 ) + exp(b_220 + b_221*p_22 ) + exp(b_320 + b_321*p_32 ))
  # probs_j2condm2 <- exp(b_220 + b_221*p_22 )/(exp(b_120 + b_121*p_12 ) + exp(b_220 + b_221*p_22 ) + exp(b_320 + b_321*p_32 ))
  # probs_j3condm2 <- exp(b_320 + b_321*p_32 )/(exp(b_120 + b_121*p_12 ) + exp(b_220 + b_221*p_22 ) + exp(b_320 + b_321*p_32 ))
  # 
  # probs_j1condm3 <- exp(b_130 + b_131*p_13 )/(exp(b_130 + b_131*p_13 ) + exp(b_230 + b_231*p_23 ) + exp(b_330 + b_331*p_33 ))
  # probs_j2condm3 <- exp(b_230 + b_231*p_23 )/(exp(b_130 + b_131*p_13 ) + exp(b_230 + b_231*p_23 ) + exp(b_330 + b_331*p_33 ))
  # probs_j3condm3 <- exp(b_330 + b_331*p_33 )/(exp(b_130 + b_131*p_13 ) + exp(b_230 + b_231*p_23 ) + exp(b_330 + b_331*p_33 ))
  # 
  # # inclusive values
  # # vary with p_11 for nest 1
  # IV_m1 <- log(exp(b_110 + b_111*pts_p11 ) + exp(b_210 + b_211*p_21 ) + exp(b_310 + b_311*p_31 )) # vector
  # IV_m2 <- log(exp(b_120 + b_121*p_12 ) + exp(b_220 + b_221*p_22 ) + exp(b_320 + b_321*p_32 )) # scalar
  # IV_m3 <- log(exp(b_130 + b_131*p_13 ) + exp(b_230 + b_231*p_23 ) + exp(b_330 + b_331*p_33 )) # scalar
  # 
  # 
  # # unconditional probabilties of nests
  # probs_m1 <- exp(a_10 + a_11*z_1 + tau_1*IV_m1)/( exp(a_10 + a_11*z_1 + tau_1*IV_m1)  + exp(a_20 + a_21*z_2 + tau_2*IV_m2) + exp(a_30 + a_31*z_3 + tau_3*IV_m3) )
  # probs_m2 <- exp(a_20 + a_21*z_2 + tau_2*IV_m2)/( exp(a_10 + a_11*z_1 + tau_1*IV_m1)  + exp(a_20 + a_21*z_2 + tau_2*IV_m2) + exp(a_30 + a_31*z_3 + tau_3*IV_m3) )
  # probs_m3 <- exp(a_30 + a_31*z_3 + tau_3*IV_m3)/( exp(a_10 + a_11*z_1 + tau_1*IV_m1)  + exp(a_20 + a_21*z_2 + tau_2*IV_m2) + exp(a_30 + a_31*z_3 + tau_3*IV_m3) )
  # 
  # # unconditional probabilities of nest-item combinations
  # probs_j1_m1 <- probs_j1condm1*probs_m1
  # probs_j2_m1 <- probs_j2condm1*probs_m1
  # probs_j3_m1 <- probs_j3condm1*probs_m1
  # 
  # probs_j1_m2 <- probs_j1condm2*probs_m2
  # probs_j2_m2 <- probs_j2condm2*probs_m2
  # probs_j3_m2 <- probs_j3condm2*probs_m2
  # 
  # probs_j1_m3 <- probs_j1condm3*probs_m3
  # probs_j2_m3 <- probs_j2condm3*probs_m3
  # probs_j3_m3 <- probs_j3condm3*probs_m3
  
  
  
  output$plot1 <- renderPlot({
    b_310 <- 0 #input$b_310
    b_320 <- 0 #input$b_320
    b_330 <- 0 #input$b_330
    a_30 <- 0 # input$a_30
    
    p_11 <- input$p_11
    p_21 <- input$p_21
    p_31 <- input$p_31
    p_12 <- input$p_12
    p_22 <- input$p_22
    p_32 <- input$p_32
    p_13 <- input$p_13
    p_23 <- input$p_23
    p_33 <- input$p_33
    
    # bjm0 is the intercept for category j in nest m
    # for each nest, one of the intercepts is zero
    b_110 <- input$b_110
    b_210 <- input$b_210
    b_120 <- input$b_120
    b_220 <- input$b_220
    b_130 <- input$b_130
    b_230 <- input$b_230
    
    # bjm1 is the price coefficient for category j in nest m
    b_111 <- input$b_111
    b_211 <- input$b_211
    b_311 <- input$b_311
    b_121 <- input$b_121
    b_221 <- input$b_221
    b_321 <- input$b_321
    b_131 <- input$b_131
    b_231 <- input$b_231
    b_331 <- input$b_331
    
    
    # there is also a nest and individual-specific variable Z_im
    z_1 <- input$z_1
    z_2 <- input$z_2
    z_3 <- input$z_3
    
    # alpha_m0 is the intercept in the nest probability for nest m
    # a_310 is set to zero for identification
    a_10 <- input$a_10
    a_20 <- input$a_20
    
    # alpha_m1 is the coefficient of Z_im for nest m
    a_11 <- input$a_11
    a_21 <- input$a_21
    a_31 <- input$a_31
    
    # there is also a tau_m paramter for each nest m
    tau_1 <- input$tau_1
    tau_2 <- input$tau_2
    tau_3 <- input$tau_3
    
    # conditional item given nest probabilites
    # vary with p_11 for nest 1
    probs_j1condm1 <- exp(b_110 + b_111*pts_p11 )/(exp(b_110 + b_111*pts_p11 ) + exp(b_210 + b_211*p_21 ) + exp(b_310 + b_311*p_31 ))
    probs_j2condm1 <- exp(b_210 + b_211*p_21 )/(exp(b_110 + b_111*pts_p11 ) + exp(b_210 + b_211*p_21 ) + exp(b_310 + b_311*p_31 ))
    probs_j3condm1 <- exp(b_310 + b_311*p_31 )/(exp(b_110 + b_111*pts_p11 ) + exp(b_210 + b_211*p_21 ) + exp(b_310 + b_311*p_31 ))
    
    # constant with respect to p_11 for nests 2 and 3
    probs_j1condm2 <- exp(b_120 + b_121*p_12 )/(exp(b_120 + b_121*p_12 ) + exp(b_220 + b_221*p_22 ) + exp(b_320 + b_321*p_32 ))
    probs_j2condm2 <- exp(b_220 + b_221*p_22 )/(exp(b_120 + b_121*p_12 ) + exp(b_220 + b_221*p_22 ) + exp(b_320 + b_321*p_32 ))
    probs_j3condm2 <- exp(b_320 + b_321*p_32 )/(exp(b_120 + b_121*p_12 ) + exp(b_220 + b_221*p_22 ) + exp(b_320 + b_321*p_32 ))
    
    probs_j1condm3 <- exp(b_130 + b_131*p_13 )/(exp(b_130 + b_131*p_13 ) + exp(b_230 + b_231*p_23 ) + exp(b_330 + b_331*p_33 ))
    probs_j2condm3 <- exp(b_230 + b_231*p_23 )/(exp(b_130 + b_131*p_13 ) + exp(b_230 + b_231*p_23 ) + exp(b_330 + b_331*p_33 ))
    probs_j3condm3 <- exp(b_330 + b_331*p_33 )/(exp(b_130 + b_131*p_13 ) + exp(b_230 + b_231*p_23 ) + exp(b_330 + b_331*p_33 ))
    
    # inclusive values
    # vary with p_11 for nest 1
    IV_m1 <- log(exp(b_110 + b_111*pts_p11 ) + exp(b_210 + b_211*p_21 ) + exp(b_310 + b_311*p_31 )) # vector
    IV_m2 <- log(exp(b_120 + b_121*p_12 ) + exp(b_220 + b_221*p_22 ) + exp(b_320 + b_321*p_32 )) # scalar
    IV_m3 <- log(exp(b_130 + b_131*p_13 ) + exp(b_230 + b_231*p_23 ) + exp(b_330 + b_331*p_33 )) # scalar
    
    
    # unconditional probabilties of nests
    probs_m1 <- exp(a_10 + a_11*z_1 + tau_1*IV_m1)/( exp(a_10 + a_11*z_1 + tau_1*IV_m1)  + exp(a_20 + a_21*z_2 + tau_2*IV_m2) + exp(a_30 + a_31*z_3 + tau_3*IV_m3) )
    probs_m2 <- exp(a_20 + a_21*z_2 + tau_2*IV_m2)/( exp(a_10 + a_11*z_1 + tau_1*IV_m1)  + exp(a_20 + a_21*z_2 + tau_2*IV_m2) + exp(a_30 + a_31*z_3 + tau_3*IV_m3) )
    probs_m3 <- exp(a_30 + a_31*z_3 + tau_3*IV_m3)/( exp(a_10 + a_11*z_1 + tau_1*IV_m1)  + exp(a_20 + a_21*z_2 + tau_2*IV_m2) + exp(a_30 + a_31*z_3 + tau_3*IV_m3) )
    
    # unconditional probabilities of nest-item combinations
    probs_j1_m1 <- probs_j1condm1*probs_m1
    probs_j2_m1 <- probs_j2condm1*probs_m1
    probs_j3_m1 <- probs_j3condm1*probs_m1
    
    probs_j1_m2 <- probs_j1condm2*probs_m2
    probs_j2_m2 <- probs_j2condm2*probs_m2
    probs_j3_m2 <- probs_j3condm2*probs_m2
    
    probs_j1_m3 <- probs_j1condm3*probs_m3
    probs_j2_m3 <- probs_j2condm3*probs_m3
    probs_j3_m3 <- probs_j3condm3*probs_m3
    
    # "#88CCEE", "#CC6677", "#DDCC77", "#117733", "#332288", "#AA4499", 
    # "#44AA99", "#999933", "#882255", "#661100", "#6699CC", "#888888"
    # lowertmp <- min(probs_j1_m1,probs_j2_m1,probs_j3_m1,
    #                 probs_j1_m2,probs_j2_m2,probs_j3_m2,
    #                 probs_j1_m3,probs_j2_m3,probs_j3_m3)
    # uppertmp <- min(probs_j1_m1,probs_j2_m1,probs_j3_m1,
    #                 probs_j1_m2,probs_j2_m2,probs_j3_m2,
    #                 probs_j1_m3,probs_j2_m3,probs_j3_m3)
    
    plot(x = pts_p11, y = probs_j1_m1, xlim = c(0, 1), ylim = c(0, 1), lwd = 2, col = "#88CCEE", type = "l",
         xlab = "price j1 m1", ylab = "Prob(S = m|X = x)")
    lines(pts_p11, probs_j2_m1, col = "#CC6677", type = "l")
    lines(pts_p11, probs_j3_m1, col = "#DDCC77", type = "l")
    lines(pts_p11, probs_j1_m2, col = "#117733", type = "l")
    lines(pts_p11, probs_j2_m2, col = "#332288", type = "l")
    lines(pts_p11, probs_j3_m2, col = "#AA4499", type = "l")
    lines(pts_p11, probs_j1_m3, col = "#44AA99", type = "l")
    lines(pts_p11, probs_j2_m3, col = "#999933", type = "l")
    lines(pts_p11, probs_j3_m3, col = "#882255", type = "l")
    
    
  })
  
  output$plot2 <- renderPlot({

    b_310 <- 0 #input$b_310
    b_320 <- 0 #input$b_320
    b_330 <- 0 #input$b_330
    a_30 <- 0 # input$a_30
    
    p_11 <- input$p_11
    p_21 <- input$p_21
    p_31 <- input$p_31
    p_12 <- input$p_12
    p_22 <- input$p_22
    p_32 <- input$p_32
    p_13 <- input$p_13
    p_23 <- input$p_23
    p_33 <- input$p_33
    
    # bjm0 is the intercept for category j in nest m
    # for each nest, one of the intercepts is zero
    b_110 <- input$b_110
    b_210 <- input$b_210
    b_120 <- input$b_120
    b_220 <- input$b_220
    b_130 <- input$b_130
    b_230 <- input$b_230
    
    # bjm1 is the price coefficient for category j in nest m
    b_111 <- input$b_111
    b_211 <- input$b_211
    b_311 <- input$b_311
    b_121 <- input$b_121
    b_221 <- input$b_221
    b_321 <- input$b_321
    b_131 <- input$b_131
    b_231 <- input$b_231
    b_331 <- input$b_331
    
    
    # there is also a nest and individual-specific variable Z_im
    z_1 <- input$z_1
    z_2 <- input$z_2
    z_3 <- input$z_3
    
    # alpha_m0 is the intercept in the nest probability for nest m
    # a_310 is set to zero for identification
    a_10 <- input$a_10
    a_20 <- input$a_20
    
    # alpha_m1 is the coefficient of Z_im for nest m
    a_11 <- input$a_11
    a_21 <- input$a_21
    a_31 <- input$a_31
    
    # there is also a tau_m paramter for each nest m
    tau_1 <- input$tau_1
    tau_2 <- input$tau_2
    tau_3 <- input$tau_3
    
    # conditional item given nest probabilites
    # vary with p_11 for nest 1
    probs_j1condm1 <- exp(b_110 + b_111*pts_p11 )/(exp(b_110 + b_111*pts_p11 ) + exp(b_210 + b_211*p_21 ) + exp(b_310 + b_311*p_31 ))
    probs_j2condm1 <- exp(b_210 + b_211*p_21 )/(exp(b_110 + b_111*pts_p11 ) + exp(b_210 + b_211*p_21 ) + exp(b_310 + b_311*p_31 ))
    probs_j3condm1 <- exp(b_310 + b_311*p_31 )/(exp(b_110 + b_111*pts_p11 ) + exp(b_210 + b_211*p_21 ) + exp(b_310 + b_311*p_31 ))

    # constant with respect to p_11 for nests 2 and 3
    probs_j1condm2 <- exp(b_120 + b_121*p_12 )/(exp(b_120 + b_121*p_12 ) + exp(b_220 + b_221*p_22 ) + exp(b_320 + b_321*p_32 ))
    probs_j2condm2 <- exp(b_220 + b_221*p_22 )/(exp(b_120 + b_121*p_12 ) + exp(b_220 + b_221*p_22 ) + exp(b_320 + b_321*p_32 ))
    probs_j3condm2 <- exp(b_320 + b_321*p_32 )/(exp(b_120 + b_121*p_12 ) + exp(b_220 + b_221*p_22 ) + exp(b_320 + b_321*p_32 ))

    probs_j1condm3 <- exp(b_130 + b_131*p_13 )/(exp(b_130 + b_131*p_13 ) + exp(b_230 + b_231*p_23 ) + exp(b_330 + b_331*p_33 ))
    probs_j2condm3 <- exp(b_230 + b_231*p_23 )/(exp(b_130 + b_131*p_13 ) + exp(b_230 + b_231*p_23 ) + exp(b_330 + b_331*p_33 ))
    probs_j3condm3 <- exp(b_330 + b_331*p_33 )/(exp(b_130 + b_131*p_13 ) + exp(b_230 + b_231*p_23 ) + exp(b_330 + b_331*p_33 ))

    # inclusive values
    # vary with p_11 for nest 1
    IV_m1 <- log(exp(b_110 + b_111*pts_p11 ) + exp(b_210 + b_211*p_21 ) + exp(b_310 + b_311*p_31 )) # vector
    IV_m2 <- log(exp(b_120 + b_121*p_12 ) + exp(b_220 + b_221*p_22 ) + exp(b_320 + b_321*p_32 )) # scalar
    IV_m3 <- log(exp(b_130 + b_131*p_13 ) + exp(b_230 + b_231*p_23 ) + exp(b_330 + b_331*p_33 )) # scalar


    # unconditional probabilties of nests
    probs_m1 <- exp(a_10 + a_11*z_1 + tau_1*IV_m1)/( exp(a_10 + a_11*z_1 + tau_1*IV_m1)  + exp(a_20 + a_21*z_2 + tau_2*IV_m2) + exp(a_30 + a_31*z_3 + tau_3*IV_m3) )
    probs_m2 <- exp(a_20 + a_21*z_2 + tau_2*IV_m2)/( exp(a_10 + a_11*z_1 + tau_1*IV_m1)  + exp(a_20 + a_21*z_2 + tau_2*IV_m2) + exp(a_30 + a_31*z_3 + tau_3*IV_m3) )
    probs_m3 <- exp(a_30 + a_31*z_3 + tau_3*IV_m3)/( exp(a_10 + a_11*z_1 + tau_1*IV_m1)  + exp(a_20 + a_21*z_2 + tau_2*IV_m2) + exp(a_30 + a_31*z_3 + tau_3*IV_m3) )

    # unconditional probabilities of nest-item combinations
    probs_j1_m1 <- probs_j1condm1*probs_m1
    probs_j2_m1 <- probs_j2condm1*probs_m1
    probs_j3_m1 <- probs_j3condm1*probs_m1

    probs_j1_m2 <- probs_j1condm2*probs_m2
    probs_j2_m2 <- probs_j2condm2*probs_m2
    probs_j3_m2 <- probs_j3condm2*probs_m2

    probs_j1_m3 <- probs_j1condm3*probs_m3
    probs_j2_m3 <- probs_j2condm3*probs_m3
    probs_j3_m3 <- probs_j3condm3*probs_m3


    # "#88CCEE", "#CC6677", "#DDCC77", "#117733", "#332288", "#AA4499",
    # "#44AA99", "#999933", "#882255", "#661100", "#6699CC", "#888888"

    plot(pts_p11,probs_m1,  xlim = c(-5, 5), ylim = c(0, 1), lwd = 2, col = "#88CCEE", type = "l",
         xlab = "price j1 m1", ylab = "Prob(S = m)")
    lines(pts_p11,probs_m2, col = "#CC6677", type = "l")
    lines(pts_p11,probs_m3, col = "#DDCC77", type = "l")

  })

  output$plot3 <- renderPlot({

    b_310 <- 0 #input$b_310
    b_320 <- 0 #input$b_320
    b_330 <- 0 #input$b_330
    a_30 <- 0 # input$a_30
    
    p_11 <- input$p_11
    p_21 <- input$p_21
    p_31 <- input$p_31
    p_12 <- input$p_12
    p_22 <- input$p_22
    p_32 <- input$p_32
    p_13 <- input$p_13
    p_23 <- input$p_23
    p_33 <- input$p_33
    
    # bjm0 is the intercept for category j in nest m
    # for each nest, one of the intercepts is zero
    b_110 <- input$b_110
    b_210 <- input$b_210
    b_120 <- input$b_120
    b_220 <- input$b_220
    b_130 <- input$b_130
    b_230 <- input$b_230
    
    # bjm1 is the price coefficient for category j in nest m
    b_111 <- input$b_111
    b_211 <- input$b_211
    b_311 <- input$b_311
    b_121 <- input$b_121
    b_221 <- input$b_221
    b_321 <- input$b_321
    b_131 <- input$b_131
    b_231 <- input$b_231
    b_331 <- input$b_331
    
    
    # there is also a nest and individual-specific variable Z_im
    z_1 <- input$z_1
    z_2 <- input$z_2
    z_3 <- input$z_3
    
    # alpha_m0 is the intercept in the nest probability for nest m
    # a_310 is set to zero for identification
    a_10 <- input$a_10
    a_20 <- input$a_20
    
    # alpha_m1 is the coefficient of Z_im for nest m
    a_11 <- input$a_11
    a_21 <- input$a_21
    a_31 <- input$a_31
    
    # there is also a tau_m paramter for each nest m
    tau_1 <- input$tau_1
    tau_2 <- input$tau_2
    tau_3 <- input$tau_3
    
    # conditional item given nest probabilites
    # vary with p_11 for nest 1
    probs_j1condm1 <- exp(b_110 + b_111*pts_p11 )/(exp(b_110 + b_111*pts_p11 ) + exp(b_210 + b_211*p_21 ) + exp(b_310 + b_311*p_31 ))
    probs_j2condm1 <- exp(b_210 + b_211*p_21 )/(exp(b_110 + b_111*pts_p11 ) + exp(b_210 + b_211*p_21 ) + exp(b_310 + b_311*p_31 ))
    probs_j3condm1 <- exp(b_310 + b_311*p_31 )/(exp(b_110 + b_111*pts_p11 ) + exp(b_210 + b_211*p_21 ) + exp(b_310 + b_311*p_31 ))

    # constant with respect to p_11 for nests 2 and 3
    probs_j1condm2 <- exp(b_120 + b_121*p_12 )/(exp(b_120 + b_121*p_12 ) + exp(b_220 + b_221*p_22 ) + exp(b_320 + b_321*p_32 ))
    probs_j2condm2 <- exp(b_220 + b_221*p_22 )/(exp(b_120 + b_121*p_12 ) + exp(b_220 + b_221*p_22 ) + exp(b_320 + b_321*p_32 ))
    probs_j3condm2 <- exp(b_320 + b_321*p_32 )/(exp(b_120 + b_121*p_12 ) + exp(b_220 + b_221*p_22 ) + exp(b_320 + b_321*p_32 ))

    probs_j1condm3 <- exp(b_130 + b_131*p_13 )/(exp(b_130 + b_131*p_13 ) + exp(b_230 + b_231*p_23 ) + exp(b_330 + b_331*p_33 ))
    probs_j2condm3 <- exp(b_230 + b_231*p_23 )/(exp(b_130 + b_131*p_13 ) + exp(b_230 + b_231*p_23 ) + exp(b_330 + b_331*p_33 ))
    probs_j3condm3 <- exp(b_330 + b_331*p_33 )/(exp(b_130 + b_131*p_13 ) + exp(b_230 + b_231*p_23 ) + exp(b_330 + b_331*p_33 ))

    # inclusive values
    # vary with p_11 for nest 1
    IV_m1 <- log(exp(b_110 + b_111*pts_p11 ) + exp(b_210 + b_211*p_21 ) + exp(b_310 + b_311*p_31 )) # vector
    IV_m2 <- log(exp(b_120 + b_121*p_12 ) + exp(b_220 + b_221*p_22 ) + exp(b_320 + b_321*p_32 )) # scalar
    IV_m3 <- log(exp(b_130 + b_131*p_13 ) + exp(b_230 + b_231*p_23 ) + exp(b_330 + b_331*p_33 )) # scalar


    # unconditional probabilties of nests
    probs_m1 <- exp(a_10 + a_11*z_1 + tau_1*IV_m1)/( exp(a_10 + a_11*z_1 + tau_1*IV_m1)  + exp(a_20 + a_21*z_2 + tau_2*IV_m2) + exp(a_30 + a_31*z_3 + tau_3*IV_m3) )
    probs_m2 <- exp(a_20 + a_21*z_2 + tau_2*IV_m2)/( exp(a_10 + a_11*z_1 + tau_1*IV_m1)  + exp(a_20 + a_21*z_2 + tau_2*IV_m2) + exp(a_30 + a_31*z_3 + tau_3*IV_m3) )
    probs_m3 <- exp(a_30 + a_31*z_3 + tau_3*IV_m3)/( exp(a_10 + a_11*z_1 + tau_1*IV_m1)  + exp(a_20 + a_21*z_2 + tau_2*IV_m2) + exp(a_30 + a_31*z_3 + tau_3*IV_m3) )

    # unconditional probabilities of nest-item combinations
    probs_j1_m1 <- probs_j1condm1*probs_m1
    probs_j2_m1 <- probs_j2condm1*probs_m1
    probs_j3_m1 <- probs_j3condm1*probs_m1

    probs_j1_m2 <- probs_j1condm2*probs_m2
    probs_j2_m2 <- probs_j2condm2*probs_m2
    probs_j3_m2 <- probs_j3condm2*probs_m2

    probs_j1_m3 <- probs_j1condm3*probs_m3
    probs_j2_m3 <- probs_j2condm3*probs_m3
    probs_j3_m3 <- probs_j3condm3*probs_m3


    # "#88CCEE", "#CC6677", "#DDCC77", "#117733", "#332288", "#AA4499",
    # "#44AA99", "#999933", "#882255", "#661100", "#6699CC", "#888888"

    plot(pts_p11, probs_j1condm1, xlim = c(-5, 5), ylim = c(0, 1), lwd = 2, col = "#88CCEE", type = "l",
         xlab = "price j1 m1", ylab = "Prob(C = j | S = 1)")
    lines(pts_p11, probs_j2condm1, col = "#CC6677", type = "l")
    lines(pts_p11, probs_j3condm1, col = "#DDCC77", type = "l")

  })



  output$plot4 <- renderPlot({
    
    b_310 <- 0 #input$b_310
    b_320 <- 0 #input$b_320
    b_330 <- 0 #input$b_330
    a_30 <- 0 # input$a_30
    
    p_11 <- input$p_11
    p_21 <- input$p_21
    p_31 <- input$p_31
    p_12 <- input$p_12
    p_22 <- input$p_22
    p_32 <- input$p_32
    p_13 <- input$p_13
    p_23 <- input$p_23
    p_33 <- input$p_33
    
    # bjm0 is the intercept for category j in nest m
    # for each nest, one of the intercepts is zero
    b_110 <- input$b_110
    b_210 <- input$b_210
    b_120 <- input$b_120
    b_220 <- input$b_220
    b_130 <- input$b_130
    b_230 <- input$b_230
    
    # bjm1 is the price coefficient for category j in nest m
    b_111 <- input$b_111
    b_211 <- input$b_211
    b_311 <- input$b_311
    b_121 <- input$b_121
    b_221 <- input$b_221
    b_321 <- input$b_321
    b_131 <- input$b_131
    b_231 <- input$b_231
    b_331 <- input$b_331
    
    
    # there is also a nest and individual-specific variable Z_im
    z_1 <- input$z_1
    z_2 <- input$z_2
    z_3 <- input$z_3
    
    # alpha_m0 is the intercept in the nest probability for nest m
    # a_310 is set to zero for identification
    a_10 <- input$a_10
    a_20 <- input$a_20
    
    # alpha_m1 is the coefficient of Z_im for nest m
    a_11 <- input$a_11
    a_21 <- input$a_21
    a_31 <- input$a_31
    
    # there is also a tau_m paramter for each nest m
    tau_1 <- input$tau_1
    tau_2 <- input$tau_2
    tau_3 <- input$tau_3
    
    
    # conditional item given nest probabilites
    # vary with p_11 for nest 1
    probs_j1condm1 <- exp(b_110 + b_111*pts_p11 )/(exp(b_110 + b_111*pts_p11 ) + exp(b_210 + b_211*p_21 ) + exp(b_310 + b_311*p_31 ))
    probs_j2condm1 <- exp(b_210 + b_211*p_21 )/(exp(b_110 + b_111*pts_p11 ) + exp(b_210 + b_211*p_21 ) + exp(b_310 + b_311*p_31 ))
    probs_j3condm1 <- exp(b_310 + b_311*p_31 )/(exp(b_110 + b_111*pts_p11 ) + exp(b_210 + b_211*p_21 ) + exp(b_310 + b_311*p_31 ))

    # constant with respect to p_11 for nests 2 and 3
    probs_j1condm2 <- exp(b_120 + b_121*p_12 )/(exp(b_120 + b_121*p_12 ) + exp(b_220 + b_221*p_22 ) + exp(b_320 + b_321*p_32 ))
    probs_j2condm2 <- exp(b_220 + b_221*p_22 )/(exp(b_120 + b_121*p_12 ) + exp(b_220 + b_221*p_22 ) + exp(b_320 + b_321*p_32 ))
    probs_j3condm2 <- exp(b_320 + b_321*p_32 )/(exp(b_120 + b_121*p_12 ) + exp(b_220 + b_221*p_22 ) + exp(b_320 + b_321*p_32 ))

    probs_j1condm3 <- exp(b_130 + b_131*p_13 )/(exp(b_130 + b_131*p_13 ) + exp(b_230 + b_231*p_23 ) + exp(b_330 + b_331*p_33 ))
    probs_j2condm3 <- exp(b_230 + b_231*p_23 )/(exp(b_130 + b_131*p_13 ) + exp(b_230 + b_231*p_23 ) + exp(b_330 + b_331*p_33 ))
    probs_j3condm3 <- exp(b_330 + b_331*p_33 )/(exp(b_130 + b_131*p_13 ) + exp(b_230 + b_231*p_23 ) + exp(b_330 + b_331*p_33 ))

    # inclusive values
    # vary with p_11 for nest 1
    IV_m1 <- log(exp(b_110 + b_111*pts_p11 ) + exp(b_210 + b_211*p_21 ) + exp(b_310 + b_311*p_31 )) # vector
    IV_m2 <- log(exp(b_120 + b_121*p_12 ) + exp(b_220 + b_221*p_22 ) + exp(b_320 + b_321*p_32 )) # scalar
    IV_m3 <- log(exp(b_130 + b_131*p_13 ) + exp(b_230 + b_231*p_23 ) + exp(b_330 + b_331*p_33 )) # scalar


    # unconditional probabilties of nests
    probs_m1 <- exp(a_10 + a_11*z_1 + tau_1*IV_m1)/( exp(a_10 + a_11*z_1 + tau_1*IV_m1)  + exp(a_20 + a_21*z_2 + tau_2*IV_m2) + exp(a_30 + a_31*z_3 + tau_3*IV_m3) )
    probs_m2 <- exp(a_20 + a_21*z_2 + tau_2*IV_m2)/( exp(a_10 + a_11*z_1 + tau_1*IV_m1)  + exp(a_20 + a_21*z_2 + tau_2*IV_m2) + exp(a_30 + a_31*z_3 + tau_3*IV_m3) )
    probs_m3 <- exp(a_30 + a_31*z_3 + tau_3*IV_m3)/( exp(a_10 + a_11*z_1 + tau_1*IV_m1)  + exp(a_20 + a_21*z_2 + tau_2*IV_m2) + exp(a_30 + a_31*z_3 + tau_3*IV_m3) )

    # unconditional probabilities of nest-item combinations
    probs_j1_m1 <- probs_j1condm1*probs_m1
    probs_j2_m1 <- probs_j2condm1*probs_m1
    probs_j3_m1 <- probs_j3condm1*probs_m1

    probs_j1_m2 <- probs_j1condm2*probs_m2
    probs_j2_m2 <- probs_j2condm2*probs_m2
    probs_j3_m2 <- probs_j3condm2*probs_m2

    probs_j1_m3 <- probs_j1condm3*probs_m3
    probs_j2_m3 <- probs_j2condm3*probs_m3
    probs_j3_m3 <- probs_j3condm3*probs_m3

    ## Evaluate odds and plot
    odds_num <- input$odds_num
    odds_denom <- input$odds_denom
    probs_num <- 1
    probs_denom <- 1
    if(odds_num == 1){ probs_num <- probs_j1_m1}
    if(odds_num == 2){ probs_num <- probs_j2_m1}
    if(odds_num == 3){ probs_num <- probs_j3_m1}
    if(odds_num == 4){ probs_num <- probs_j1_m2}
    if(odds_num == 5){ probs_num <- probs_j2_m2}
    if(odds_num == 6){ probs_num <- probs_j3_m2}
    if(odds_num == 7){ probs_num <- probs_j1_m3}
    if(odds_num == 8){ probs_num <- probs_j2_m3}
    if(odds_num == 9){ probs_num <- probs_j3_m3}

    if(odds_denom == 1){ probs_denom <- probs_j1_m1}
    if(odds_denom == 2){ probs_denom <- probs_j2_m1}
    if(odds_denom == 3){ probs_denom <- probs_j3_m1}
    if(odds_denom == 4){ probs_denom <- probs_j1_m2}
    if(odds_denom == 5){ probs_denom <- probs_j2_m2}
    if(odds_denom == 6){ probs_denom <- probs_j3_m2}
    if(odds_denom == 7){ probs_denom <- probs_j1_m3}
    if(odds_denom == 8){ probs_denom <- probs_j2_m3}
    if(odds_denom == 9){ probs_denom <- probs_j3_m3}

    oddsplot <- probs_num/probs_denom

    plot(pts_p11, oddsplot, xlim = c(-5,5), ylim = c(min(c(0,oddsplot)), max(c(0,oddsplot))), #ylim = c(-abs(gamma1)/2, abs(gamma1)/2),
         lwd = 2, col = "darkgoldenrod3", type = "l",
         xlab = "w1", ylab = "Odds against price of item 1")

  })

  output$plot5 <- renderPlot({
    
    b_310 <- 0 #input$b_310
    b_320 <- 0 #input$b_320
    b_330 <- 0 #input$b_330
    a_30 <- 0 # input$a_30
    
    p_11 <- input$p_11
    p_21 <- input$p_21
    p_31 <- input$p_31
    p_12 <- input$p_12
    p_22 <- input$p_22
    p_32 <- input$p_32
    p_13 <- input$p_13
    p_23 <- input$p_23
    p_33 <- input$p_33
    
    # bjm0 is the intercept for category j in nest m
    # for each nest, one of the intercepts is zero
    b_110 <- input$b_110
    b_210 <- input$b_210
    b_120 <- input$b_120
    b_220 <- input$b_220
    b_130 <- input$b_130
    b_230 <- input$b_230
    
    # bjm1 is the price coefficient for category j in nest m
    b_111 <- input$b_111
    b_211 <- input$b_211
    b_311 <- input$b_311
    b_121 <- input$b_121
    b_221 <- input$b_221
    b_321 <- input$b_321
    b_131 <- input$b_131
    b_231 <- input$b_231
    b_331 <- input$b_331
    
    
    # there is also a nest and individual-specific variable Z_im
    z_1 <- input$z_1
    z_2 <- input$z_2
    z_3 <- input$z_3
    
    # alpha_m0 is the intercept in the nest probability for nest m
    # a_310 is set to zero for identification
    a_10 <- input$a_10
    a_20 <- input$a_20
    
    # alpha_m1 is the coefficient of Z_im for nest m
    a_11 <- input$a_11
    a_21 <- input$a_21
    a_31 <- input$a_31
    
    # there is also a tau_m paramter for each nest m
    tau_1 <- input$tau_1
    tau_2 <- input$tau_2
    tau_3 <- input$tau_3
    
    # conditional item given nest probabilites
    # vary with p_11 for nest 1
    probs_j1condm1 <- exp(b_110 + b_111*pts_p11 )/(exp(b_110 + b_111*pts_p11 ) + exp(b_210 + b_211*p_21 ) + exp(b_310 + b_311*p_31 ))
    probs_j2condm1 <- exp(b_210 + b_211*p_21 )/(exp(b_110 + b_111*pts_p11 ) + exp(b_210 + b_211*p_21 ) + exp(b_310 + b_311*p_31 ))
    probs_j3condm1 <- exp(b_310 + b_311*p_31 )/(exp(b_110 + b_111*pts_p11 ) + exp(b_210 + b_211*p_21 ) + exp(b_310 + b_311*p_31 ))

    # constant with respect to p_11 for nests 2 and 3
    probs_j1condm2 <- exp(b_120 + b_121*p_12 )/(exp(b_120 + b_121*p_12 ) + exp(b_220 + b_221*p_22 ) + exp(b_320 + b_321*p_32 ))
    probs_j2condm2 <- exp(b_220 + b_221*p_22 )/(exp(b_120 + b_121*p_12 ) + exp(b_220 + b_221*p_22 ) + exp(b_320 + b_321*p_32 ))
    probs_j3condm2 <- exp(b_320 + b_321*p_32 )/(exp(b_120 + b_121*p_12 ) + exp(b_220 + b_221*p_22 ) + exp(b_320 + b_321*p_32 ))

    probs_j1condm3 <- exp(b_130 + b_131*p_13 )/(exp(b_130 + b_131*p_13 ) + exp(b_230 + b_231*p_23 ) + exp(b_330 + b_331*p_33 ))
    probs_j2condm3 <- exp(b_230 + b_231*p_23 )/(exp(b_130 + b_131*p_13 ) + exp(b_230 + b_231*p_23 ) + exp(b_330 + b_331*p_33 ))
    probs_j3condm3 <- exp(b_330 + b_331*p_33 )/(exp(b_130 + b_131*p_13 ) + exp(b_230 + b_231*p_23 ) + exp(b_330 + b_331*p_33 ))

    # inclusive values
    # vary with p_11 for nest 1
    IV_m1 <- log(exp(b_110 + b_111*pts_p11 ) + exp(b_210 + b_211*p_21 ) + exp(b_310 + b_311*p_31 )) # vector
    IV_m2 <- log(exp(b_120 + b_121*p_12 ) + exp(b_220 + b_221*p_22 ) + exp(b_320 + b_321*p_32 )) # scalar
    IV_m3 <- log(exp(b_130 + b_131*p_13 ) + exp(b_230 + b_231*p_23 ) + exp(b_330 + b_331*p_33 )) # scalar


    # unconditional probabilties of nests
    probs_m1 <- exp(a_10 + a_11*z_1 + tau_1*IV_m1)/( exp(a_10 + a_11*z_1 + tau_1*IV_m1)  + exp(a_20 + a_21*z_2 + tau_2*IV_m2) + exp(a_30 + a_31*z_3 + tau_3*IV_m3) )
    probs_m2 <- exp(a_20 + a_21*z_2 + tau_2*IV_m2)/( exp(a_10 + a_11*z_1 + tau_1*IV_m1)  + exp(a_20 + a_21*z_2 + tau_2*IV_m2) + exp(a_30 + a_31*z_3 + tau_3*IV_m3) )
    probs_m3 <- exp(a_30 + a_31*z_3 + tau_3*IV_m3)/( exp(a_10 + a_11*z_1 + tau_1*IV_m1)  + exp(a_20 + a_21*z_2 + tau_2*IV_m2) + exp(a_30 + a_31*z_3 + tau_3*IV_m3) )

    # unconditional probabilities of nest-item combinations
    probs_j1_m1 <- probs_j1condm1*probs_m1
    probs_j2_m1 <- probs_j2condm1*probs_m1
    probs_j3_m1 <- probs_j3condm1*probs_m1

    probs_j1_m2 <- probs_j1condm2*probs_m2
    probs_j2_m2 <- probs_j2condm2*probs_m2
    probs_j3_m2 <- probs_j3condm2*probs_m2

    probs_j1_m3 <- probs_j1condm3*probs_m3
    probs_j2_m3 <- probs_j2condm3*probs_m3
    probs_j3_m3 <- probs_j3condm3*probs_m3


    # own-price marginal effect for j=1 m=1
    PE_1 <- b_111 * probs_j1_m1 * ( 1 - tau_1 * probs_j1_m1 +  ( tau_1 - 1)*probs_j1condm1  )

    # cross-price partial effects of j=1 on other alternatives in nest m=1
    PE_2 <- b_211 * probs_j2_m1 * probs_j1condm1*(  tau_1 *  ( 1 - probs_m2) - 1  )
    PE_3 <- b_311 * probs_j3_m1 * probs_j1condm1*(  tau_1 *  ( 1 - probs_m3) - 1  )

    # cross-price partial effects on items in other nests
    PE_4 <- - tau_2 * b_121 * probs_j1_m1 * probs_j1_m2
    PE_5 <- - tau_2 * b_221 * probs_j1_m1 * probs_j2_m2
    PE_6 <- - tau_2 * b_321 * probs_j1_m1 * probs_j3_m2
    PE_7 <- - tau_3 * b_131 * probs_j1_m1 * probs_j1_m3
    PE_8 <- - tau_3 * b_231 * probs_j1_m1 * probs_j2_m3
    PE_9 <- - tau_3 * b_331 * probs_j1_m1 * probs_j3_m3

    lowertmp <- min(0,PE_1,PE_2,PE_3,
                    PE_4,PE_5,PE_6,
                    PE_7,PE_8,PE_9)
    uppertmp <- max(0,PE_1,PE_2,PE_3,
                    PE_4,PE_5,PE_6,
                    PE_7,PE_8,PE_9)

    plot(pts_p11, PE_1, xlim = c(-5, 5), ylim = c(lowertmp, uppertmp), lwd = 2, col = "#88CCEE", type = "l",
         xlab = "w1", ylab = "Partial effect price_1 on P(Y=j,S=m) against price of item 1")
    lines(pts_p11, PE_2, col = "#CC6677", type = "l")
    lines(pts_p11, PE_3, col = "#DDCC77", type = "l")
    lines(pts_p11, PE_4, col = "#117733", type = "l")
    lines(pts_p11, PE_5, col = "#332288", type = "l")
    lines(pts_p11, PE_6, col = "#AA4499", type = "l")
    lines(pts_p11, PE_7, col = "#44AA99", type = "l")
    lines(pts_p11, PE_8, col = "#999933", type = "l")
    lines(pts_p11, PE_9, col = "#882255", type = "l")
  })

  output$plot6 <- renderPlot({
    
    b_310 <- 0 #input$b_310
    b_320 <- 0 #input$b_320
    b_330 <- 0 #input$b_330
    a_30 <- 0 # input$a_30
    
    p_11 <- input$p_11
    p_21 <- input$p_21
    p_31 <- input$p_31
    p_12 <- input$p_12
    p_22 <- input$p_22
    p_32 <- input$p_32
    p_13 <- input$p_13
    p_23 <- input$p_23
    p_33 <- input$p_33
    
    # bjm0 is the intercept for category j in nest m
    # for each nest, one of the intercepts is zero
    b_110 <- input$b_110
    b_210 <- input$b_210
    b_120 <- input$b_120
    b_220 <- input$b_220
    b_130 <- input$b_130
    b_230 <- input$b_230
    
    # bjm1 is the price coefficient for category j in nest m
    b_111 <- input$b_111
    b_211 <- input$b_211
    b_311 <- input$b_311
    b_121 <- input$b_121
    b_221 <- input$b_221
    b_321 <- input$b_321
    b_131 <- input$b_131
    b_231 <- input$b_231
    b_331 <- input$b_331
    
    
    # there is also a nest and individual-specific variable Z_im
    z_1 <- input$z_1
    z_2 <- input$z_2
    z_3 <- input$z_3
    
    # alpha_m0 is the intercept in the nest probability for nest m
    # a_310 is set to zero for identification
    a_10 <- input$a_10
    a_20 <- input$a_20
    
    # alpha_m1 is the coefficient of Z_im for nest m
    a_11 <- input$a_11
    a_21 <- input$a_21
    a_31 <- input$a_31
    
    # there is also a tau_m paramter for each nest m
    tau_1 <- input$tau_1
    tau_2 <- input$tau_2
    tau_3 <- input$tau_3
    
    # conditional item given nest probabilites
    # vary with p_11 for nest 1
    probs_j1condm1 <- exp(b_110 + b_111*pts_p11 )/(exp(b_110 + b_111*pts_p11 ) + exp(b_210 + b_211*p_21 ) + exp(b_310 + b_311*p_31 ))
    probs_j2condm1 <- exp(b_210 + b_211*p_21 )/(exp(b_110 + b_111*pts_p11 ) + exp(b_210 + b_211*p_21 ) + exp(b_310 + b_311*p_31 ))
    probs_j3condm1 <- exp(b_310 + b_311*p_31 )/(exp(b_110 + b_111*pts_p11 ) + exp(b_210 + b_211*p_21 ) + exp(b_310 + b_311*p_31 ))

    # constant with respect to p_11 for nests 2 and 3
    probs_j1condm2 <- exp(b_120 + b_121*p_12 )/(exp(b_120 + b_121*p_12 ) + exp(b_220 + b_221*p_22 ) + exp(b_320 + b_321*p_32 ))
    probs_j2condm2 <- exp(b_220 + b_221*p_22 )/(exp(b_120 + b_121*p_12 ) + exp(b_220 + b_221*p_22 ) + exp(b_320 + b_321*p_32 ))
    probs_j3condm2 <- exp(b_320 + b_321*p_32 )/(exp(b_120 + b_121*p_12 ) + exp(b_220 + b_221*p_22 ) + exp(b_320 + b_321*p_32 ))

    probs_j1condm3 <- exp(b_130 + b_131*p_13 )/(exp(b_130 + b_131*p_13 ) + exp(b_230 + b_231*p_23 ) + exp(b_330 + b_331*p_33 ))
    probs_j2condm3 <- exp(b_230 + b_231*p_23 )/(exp(b_130 + b_131*p_13 ) + exp(b_230 + b_231*p_23 ) + exp(b_330 + b_331*p_33 ))
    probs_j3condm3 <- exp(b_330 + b_331*p_33 )/(exp(b_130 + b_131*p_13 ) + exp(b_230 + b_231*p_23 ) + exp(b_330 + b_331*p_33 ))

    # inclusive values
    # vary with p_11 for nest 1
    IV_m1 <- log(exp(b_110 + b_111*pts_p11 ) + exp(b_210 + b_211*p_21 ) + exp(b_310 + b_311*p_31 )) # vector
    IV_m2 <- log(exp(b_120 + b_121*p_12 ) + exp(b_220 + b_221*p_22 ) + exp(b_320 + b_321*p_32 )) # scalar
    IV_m3 <- log(exp(b_130 + b_131*p_13 ) + exp(b_230 + b_231*p_23 ) + exp(b_330 + b_331*p_33 )) # scalar


    # unconditional probabilties of nests
    probs_m1 <- exp(a_10 + a_11*z_1 + tau_1*IV_m1)/( exp(a_10 + a_11*z_1 + tau_1*IV_m1)  + exp(a_20 + a_21*z_2 + tau_2*IV_m2) + exp(a_30 + a_31*z_3 + tau_3*IV_m3) )
    probs_m2 <- exp(a_20 + a_21*z_2 + tau_2*IV_m2)/( exp(a_10 + a_11*z_1 + tau_1*IV_m1)  + exp(a_20 + a_21*z_2 + tau_2*IV_m2) + exp(a_30 + a_31*z_3 + tau_3*IV_m3) )
    probs_m3 <- exp(a_30 + a_31*z_3 + tau_3*IV_m3)/( exp(a_10 + a_11*z_1 + tau_1*IV_m1)  + exp(a_20 + a_21*z_2 + tau_2*IV_m2) + exp(a_30 + a_31*z_3 + tau_3*IV_m3) )

    # unconditional probabilities of nest-item combinations
    probs_j1_m1 <- probs_j1condm1*probs_m1
    probs_j2_m1 <- probs_j2condm1*probs_m1
    probs_j3_m1 <- probs_j3condm1*probs_m1

    probs_j1_m2 <- probs_j1condm2*probs_m2
    probs_j2_m2 <- probs_j2condm2*probs_m2
    probs_j3_m2 <- probs_j3condm2*probs_m2

    probs_j1_m3 <- probs_j1condm3*probs_m3
    probs_j2_m3 <- probs_j2condm3*probs_m3
    probs_j3_m3 <- probs_j3condm3*probs_m3


    # own-price marginal effect for j=1 m=1
    nest_PE_1 <- b_111 * tau_1 * ( 1 - probs_m1) *  probs_j1_m1

    # cross-price partial effects of j=1 on other alternatives in nest m=1
    nest_PE_2 <- - b_111 * tau_1 * (  probs_m2) *  probs_j1_m1
    nest_PE_3 <- - b_111 * tau_1 * (  probs_m3) *  probs_j1_m1

    lowertmp <- min(c(0,nest_PE_1, nest_PE_2, nest_PE_3))
    uppertmp <- max(c(0,nest_PE_1, nest_PE_2, nest_PE_3))
    
    plot(pts_p11, nest_PE_1, xlim = c(-5,5), ylim = c(lowertmp, uppertmp), #ylim = c(-abs(gamma1)/2, abs(gamma1)/2),
         lwd = 2, col = "#88CCEE", type = "l",
         xlab = "w1", ylab = "Partial effect price_1 on P(S=m) against price of item 1")
    lines(pts_p11, nest_PE_2, col = "#CC6677", type = "l")
    lines(pts_p11, nest_PE_3, col = "#DDCC77", type = "l")
  })

  # calculate probabilties as functions of z1
  # p_11 <- input$p_11 # now price of item 1 is fixed

  # probs_j1condm1 <- exp(b_110 + b_111*pts_p11 )/(exp(b_110 + b_111*p_11 ) + exp(b_210 + b_211*p_21 ) + exp(b_310 + b_311*p_31 ))
  # probs_j2condm1 <- exp(b_210 + b_211*p_21 )/(exp(b_110 + b_111*p_11 ) + exp(b_210 + b_211*p_21 ) + exp(b_310 + b_311*p_31 ))
  # probs_j3condm1 <- exp(b_310 + b_311*p_31 )/(exp(b_110 + b_111*p_11 ) + exp(b_210 + b_211*p_21 ) + exp(b_310 + b_311*p_31 ))
  #
  # # constant with respect to p_11 for nests 2 and 3
  # probs_j1condm2 <- exp(b_120 + b_121*p_12 )/(exp(b_120 + b_121*p_12 ) + exp(b_220 + b_221*p_22 ) + exp(b_320 + b_321*p_32 ))
  # probs_j2condm2 <- exp(b_220 + b_221*p_22 )/(exp(b_120 + b_121*p_12 ) + exp(b_220 + b_221*p_22 ) + exp(b_320 + b_321*p_32 ))
  # probs_j3condm2 <- exp(b_320 + b_321*p_32 )/(exp(b_120 + b_121*p_12 ) + exp(b_220 + b_221*p_22 ) + exp(b_320 + b_321*p_32 ))
  #
  # probs_j1condm3 <- exp(b_130 + b_131*p_13 )/(exp(b_130 + b_131*p_13 ) + exp(b_230 + b_231*p_23 ) + exp(b_330 + b_331*p_33 ))
  # probs_j2condm3 <- exp(b_230 + b_231*p_23 )/(exp(b_130 + b_131*p_13 ) + exp(b_230 + b_231*p_23 ) + exp(b_330 + b_331*p_33 ))
  # probs_j3condm3 <- exp(b_330 + b_331*p_33 )/(exp(b_130 + b_131*p_13 ) + exp(b_230 + b_231*p_23 ) + exp(b_330 + b_331*p_33 ))
  #
  # # inclusive values
  # # vary with p_11 for nest 1
  # IV_m1 <- log(exp(b_110 + b_111*p_11 ) + exp(b_210 + b_211*p_21 ) + exp(b_310 + b_311*p_31 )) # vector
  # IV_m2 <- log(exp(b_120 + b_121*p_12 ) + exp(b_220 + b_221*p_22 ) + exp(b_320 + b_321*p_32 )) # scalar
  # IV_m3 <- log(exp(b_130 + b_131*p_13 ) + exp(b_230 + b_231*p_23 ) + exp(b_330 + b_331*p_33 )) # scalar
  #
  #
  # # unconditional probabilties of nests
  # probs_m1 <- exp(a_10 + a_11*pts_pz1 + tau_1*IV_m1)/( exp(a_10 + a_11*pts_pz1 + tau_1*IV_m1)  + exp(a_20 + a_21*z_2 + tau_2*IV_m2) + exp(a_30 + a_31*z_3 + tau_3*IV_m3) )
  # probs_m2 <- exp(a_20 + a_21*z_2 + tau_2*IV_m2)/( exp(a_10 + a_11*pts_pz1 + tau_1*IV_m1)  + exp(a_20 + a_21*z_2 + tau_2*IV_m2) + exp(a_30 + a_31*z_3 + tau_3*IV_m3) )
  # probs_m3 <- exp(a_30 + a_31*z_3 + tau_3*IV_m3)/( exp(a_10 + a_11*pts_pz1 + tau_1*IV_m1)  + exp(a_20 + a_21*z_2 + tau_2*IV_m2) + exp(a_30 + a_31*z_3 + tau_3*IV_m3) )
  #
  # # unconditional probabilities of nest-item combinations
  # probs_j1_m1 <- probs_j1condm1*probs_m1
  # probs_j2_m1 <- probs_j2condm1*probs_m1
  # probs_j3_m1 <- probs_j3condm1*probs_m1
  #
  # probs_j1_m2 <- probs_j1condm2*probs_m2
  # probs_j2_m2 <- probs_j2condm2*probs_m2
  # probs_j3_m2 <- probs_j3condm2*probs_m2
  #
  # probs_j1_m3 <- probs_j1condm3*probs_m3
  # probs_j2_m3 <- probs_j2condm3*probs_m3
  # probs_j3_m3 <- probs_j3condm3*probs_m3


  output$plot7 <- renderPlot({
    
    b_310 <- 0 #input$b_310
    b_320 <- 0 #input$b_320
    b_330 <- 0 #input$b_330
    a_30 <- 0 # input$a_30
    
    p_11 <- input$p_11
    p_21 <- input$p_21
    p_31 <- input$p_31
    p_12 <- input$p_12
    p_22 <- input$p_22
    p_32 <- input$p_32
    p_13 <- input$p_13
    p_23 <- input$p_23
    p_33 <- input$p_33
    
    # bjm0 is the intercept for category j in nest m
    # for each nest, one of the intercepts is zero
    b_110 <- input$b_110
    b_210 <- input$b_210
    b_120 <- input$b_120
    b_220 <- input$b_220
    b_130 <- input$b_130
    b_230 <- input$b_230
    
    # bjm1 is the price coefficient for category j in nest m
    b_111 <- input$b_111
    b_211 <- input$b_211
    b_311 <- input$b_311
    b_121 <- input$b_121
    b_221 <- input$b_221
    b_321 <- input$b_321
    b_131 <- input$b_131
    b_231 <- input$b_231
    b_331 <- input$b_331
    
    
    # there is also a nest and individual-specific variable Z_im
    z_1 <- input$z_1
    z_2 <- input$z_2
    z_3 <- input$z_3
    
    # alpha_m0 is the intercept in the nest probability for nest m
    # a_310 is set to zero for identification
    a_10 <- input$a_10
    a_20 <- input$a_20
    
    # alpha_m1 is the coefficient of Z_im for nest m
    a_11 <- input$a_11
    a_21 <- input$a_21
    a_31 <- input$a_31
    
    # there is also a tau_m paramter for each nest m
    tau_1 <- input$tau_1
    tau_2 <- input$tau_2
    tau_3 <- input$tau_3
    
    probs_j1condm1 <- exp(b_110 + b_111*pts_p11 )/(exp(b_110 + b_111*p_11 ) + exp(b_210 + b_211*p_21 ) + exp(b_310 + b_311*p_31 ))
    probs_j2condm1 <- exp(b_210 + b_211*p_21 )/(exp(b_110 + b_111*p_11 ) + exp(b_210 + b_211*p_21 ) + exp(b_310 + b_311*p_31 ))
    probs_j3condm1 <- exp(b_310 + b_311*p_31 )/(exp(b_110 + b_111*p_11 ) + exp(b_210 + b_211*p_21 ) + exp(b_310 + b_311*p_31 ))

    # constant with respect to p_11 for nests 2 and 3
    probs_j1condm2 <- exp(b_120 + b_121*p_12 )/(exp(b_120 + b_121*p_12 ) + exp(b_220 + b_221*p_22 ) + exp(b_320 + b_321*p_32 ))
    probs_j2condm2 <- exp(b_220 + b_221*p_22 )/(exp(b_120 + b_121*p_12 ) + exp(b_220 + b_221*p_22 ) + exp(b_320 + b_321*p_32 ))
    probs_j3condm2 <- exp(b_320 + b_321*p_32 )/(exp(b_120 + b_121*p_12 ) + exp(b_220 + b_221*p_22 ) + exp(b_320 + b_321*p_32 ))

    probs_j1condm3 <- exp(b_130 + b_131*p_13 )/(exp(b_130 + b_131*p_13 ) + exp(b_230 + b_231*p_23 ) + exp(b_330 + b_331*p_33 ))
    probs_j2condm3 <- exp(b_230 + b_231*p_23 )/(exp(b_130 + b_131*p_13 ) + exp(b_230 + b_231*p_23 ) + exp(b_330 + b_331*p_33 ))
    probs_j3condm3 <- exp(b_330 + b_331*p_33 )/(exp(b_130 + b_131*p_13 ) + exp(b_230 + b_231*p_23 ) + exp(b_330 + b_331*p_33 ))

    # inclusive values
    # vary with p_11 for nest 1
    IV_m1 <- log(exp(b_110 + b_111*p_11 ) + exp(b_210 + b_211*p_21 ) + exp(b_310 + b_311*p_31 )) # vector
    IV_m2 <- log(exp(b_120 + b_121*p_12 ) + exp(b_220 + b_221*p_22 ) + exp(b_320 + b_321*p_32 )) # scalar
    IV_m3 <- log(exp(b_130 + b_131*p_13 ) + exp(b_230 + b_231*p_23 ) + exp(b_330 + b_331*p_33 )) # scalar


    # unconditional probabilties of nests
    probs_m1 <- exp(a_10 + a_11*pts_pz1 + tau_1*IV_m1)/( exp(a_10 + a_11*pts_pz1 + tau_1*IV_m1)  + exp(a_20 + a_21*z_2 + tau_2*IV_m2) + exp(a_30 + a_31*z_3 + tau_3*IV_m3) )
    probs_m2 <- exp(a_20 + a_21*z_2 + tau_2*IV_m2)/( exp(a_10 + a_11*pts_pz1 + tau_1*IV_m1)  + exp(a_20 + a_21*z_2 + tau_2*IV_m2) + exp(a_30 + a_31*z_3 + tau_3*IV_m3) )
    probs_m3 <- exp(a_30 + a_31*z_3 + tau_3*IV_m3)/( exp(a_10 + a_11*pts_pz1 + tau_1*IV_m1)  + exp(a_20 + a_21*z_2 + tau_2*IV_m2) + exp(a_30 + a_31*z_3 + tau_3*IV_m3) )

    # unconditional probabilities of nest-item combinations
    probs_j1_m1 <- probs_j1condm1*probs_m1
    probs_j2_m1 <- probs_j2condm1*probs_m1
    probs_j3_m1 <- probs_j3condm1*probs_m1

    probs_j1_m2 <- probs_j1condm2*probs_m2
    probs_j2_m2 <- probs_j2condm2*probs_m2
    probs_j3_m2 <- probs_j3condm2*probs_m2

    probs_j1_m3 <- probs_j1condm3*probs_m3
    probs_j2_m3 <- probs_j2condm3*probs_m3
    probs_j3_m3 <- probs_j3condm3*probs_m3

    # "#88CCEE", "#CC6677", "#DDCC77", "#117733", "#332288", "#AA4499",
    # "#44AA99", "#999933", "#882255", "#661100", "#6699CC", "#888888"
    # lowertmp <- min(probs_j1_m1,probs_j2_m1,probs_j3_m1,
    #                 probs_j1_m2,probs_j2_m2,probs_j3_m2,
    #                 probs_j1_m3,probs_j2_m3,probs_j3_m3)
    # uppertmp <- min(probs_j1_m1,probs_j2_m1,probs_j3_m1,
    #                 probs_j1_m2,probs_j2_m2,probs_j3_m2,
    #                 probs_j1_m3,probs_j2_m3,probs_j3_m3)

    plot(pts_pz1,probs_j1_m1,  xlim = c(-5, 5), ylim = c(0, 1), lwd = 2, col = "#88CCEE", type = "l",
         xlab = "z1", ylab = "Prob(Y=j, S = m|X = x)")
    lines(pts_pz1,probs_j2_m1, col = "#CC6677", type = "l")
    lines(pts_pz1,probs_j3_m1, col = "#DDCC77", type = "l")
    lines(pts_pz1,probs_j1_m2, col = "#117733", type = "l")
    lines(pts_pz1,probs_j2_m2, col = "#332288", type = "l")
    lines(pts_pz1,probs_j3_m2, col = "#AA4499", type = "l")
    lines(pts_pz1,probs_j1_m3, col = "#44AA99", type = "l")
    lines(pts_pz1,probs_j2_m3, col = "#999933", type = "l")
    lines(pts_pz1,probs_j3_m3, col = "#882255", type = "l")

  })

  output$plot8 <- renderPlot({

    b_310 <- 0 #input$b_310
    b_320 <- 0 #input$b_320
    b_330 <- 0 #input$b_330
    a_30 <- 0 # input$a_30
    
    p_11 <- input$p_11
    p_21 <- input$p_21
    p_31 <- input$p_31
    p_12 <- input$p_12
    p_22 <- input$p_22
    p_32 <- input$p_32
    p_13 <- input$p_13
    p_23 <- input$p_23
    p_33 <- input$p_33
    
    # bjm0 is the intercept for category j in nest m
    # for each nest, one of the intercepts is zero
    b_110 <- input$b_110
    b_210 <- input$b_210
    b_120 <- input$b_120
    b_220 <- input$b_220
    b_130 <- input$b_130
    b_230 <- input$b_230
    
    # bjm1 is the price coefficient for category j in nest m
    b_111 <- input$b_111
    b_211 <- input$b_211
    b_311 <- input$b_311
    b_121 <- input$b_121
    b_221 <- input$b_221
    b_321 <- input$b_321
    b_131 <- input$b_131
    b_231 <- input$b_231
    b_331 <- input$b_331
    
    
    # there is also a nest and individual-specific variable Z_im
    z_1 <- input$z_1
    z_2 <- input$z_2
    z_3 <- input$z_3
    
    # alpha_m0 is the intercept in the nest probability for nest m
    # a_310 is set to zero for identification
    a_10 <- input$a_10
    a_20 <- input$a_20
    
    # alpha_m1 is the coefficient of Z_im for nest m
    a_11 <- input$a_11
    a_21 <- input$a_21
    a_31 <- input$a_31
    
    # there is also a tau_m paramter for each nest m
    tau_1 <- input$tau_1
    tau_2 <- input$tau_2
    tau_3 <- input$tau_3
    
    probs_j1condm1 <- exp(b_110 + b_111*pts_p11 )/(exp(b_110 + b_111*p_11 ) + exp(b_210 + b_211*p_21 ) + exp(b_310 + b_311*p_31 ))
    probs_j2condm1 <- exp(b_210 + b_211*p_21 )/(exp(b_110 + b_111*p_11 ) + exp(b_210 + b_211*p_21 ) + exp(b_310 + b_311*p_31 ))
    probs_j3condm1 <- exp(b_310 + b_311*p_31 )/(exp(b_110 + b_111*p_11 ) + exp(b_210 + b_211*p_21 ) + exp(b_310 + b_311*p_31 ))

    # constant with respect to p_11 for nests 2 and 3
    probs_j1condm2 <- exp(b_120 + b_121*p_12 )/(exp(b_120 + b_121*p_12 ) + exp(b_220 + b_221*p_22 ) + exp(b_320 + b_321*p_32 ))
    probs_j2condm2 <- exp(b_220 + b_221*p_22 )/(exp(b_120 + b_121*p_12 ) + exp(b_220 + b_221*p_22 ) + exp(b_320 + b_321*p_32 ))
    probs_j3condm2 <- exp(b_320 + b_321*p_32 )/(exp(b_120 + b_121*p_12 ) + exp(b_220 + b_221*p_22 ) + exp(b_320 + b_321*p_32 ))

    probs_j1condm3 <- exp(b_130 + b_131*p_13 )/(exp(b_130 + b_131*p_13 ) + exp(b_230 + b_231*p_23 ) + exp(b_330 + b_331*p_33 ))
    probs_j2condm3 <- exp(b_230 + b_231*p_23 )/(exp(b_130 + b_131*p_13 ) + exp(b_230 + b_231*p_23 ) + exp(b_330 + b_331*p_33 ))
    probs_j3condm3 <- exp(b_330 + b_331*p_33 )/(exp(b_130 + b_131*p_13 ) + exp(b_230 + b_231*p_23 ) + exp(b_330 + b_331*p_33 ))

    # inclusive values
    # vary with p_11 for nest 1
    IV_m1 <- log(exp(b_110 + b_111*p_11 ) + exp(b_210 + b_211*p_21 ) + exp(b_310 + b_311*p_31 )) # vector
    IV_m2 <- log(exp(b_120 + b_121*p_12 ) + exp(b_220 + b_221*p_22 ) + exp(b_320 + b_321*p_32 )) # scalar
    IV_m3 <- log(exp(b_130 + b_131*p_13 ) + exp(b_230 + b_231*p_23 ) + exp(b_330 + b_331*p_33 )) # scalar


    # unconditional probabilties of nests
    probs_m1 <- exp(a_10 + a_11*pts_pz1 + tau_1*IV_m1)/( exp(a_10 + a_11*pts_pz1 + tau_1*IV_m1)  + exp(a_20 + a_21*z_2 + tau_2*IV_m2) + exp(a_30 + a_31*z_3 + tau_3*IV_m3) )
    probs_m2 <- exp(a_20 + a_21*z_2 + tau_2*IV_m2)/( exp(a_10 + a_11*pts_pz1 + tau_1*IV_m1)  + exp(a_20 + a_21*z_2 + tau_2*IV_m2) + exp(a_30 + a_31*z_3 + tau_3*IV_m3) )
    probs_m3 <- exp(a_30 + a_31*z_3 + tau_3*IV_m3)/( exp(a_10 + a_11*pts_pz1 + tau_1*IV_m1)  + exp(a_20 + a_21*z_2 + tau_2*IV_m2) + exp(a_30 + a_31*z_3 + tau_3*IV_m3) )

    # unconditional probabilities of nest-item combinations
    probs_j1_m1 <- probs_j1condm1*probs_m1
    probs_j2_m1 <- probs_j2condm1*probs_m1
    probs_j3_m1 <- probs_j3condm1*probs_m1

    probs_j1_m2 <- probs_j1condm2*probs_m2
    probs_j2_m2 <- probs_j2condm2*probs_m2
    probs_j3_m2 <- probs_j3condm2*probs_m2

    probs_j1_m3 <- probs_j1condm3*probs_m3
    probs_j2_m3 <- probs_j2condm3*probs_m3
    probs_j3_m3 <- probs_j3condm3*probs_m3
    # "#88CCEE", "#CC6677", "#DDCC77", "#117733", "#332288", "#AA4499",
    # "#44AA99", "#999933", "#882255", "#661100", "#6699CC", "#888888"

    plot(pts_pz1,probs_m1, xlim = c(-5, 5), ylim = c(0, 1), lwd = 2, col = "#88CCEE", type = "l",
         xlab = "z1", ylab = "Prob(S = m|X = x)")
    lines(pts_pz1,probs_m2,  col = "#CC6677", type = "l")
    lines(pts_pz1,probs_m3,  col = "#DDCC77", type = "l")
  })


  output$plot9 <- renderPlot({
    b_310 <- 0 #input$b_310
    b_320 <- 0 #input$b_320
    b_330 <- 0 #input$b_330
    a_30 <- 0 # input$a_30
    
    p_11 <- input$p_11
    p_21 <- input$p_21
    p_31 <- input$p_31
    p_12 <- input$p_12
    p_22 <- input$p_22
    p_32 <- input$p_32
    p_13 <- input$p_13
    p_23 <- input$p_23
    p_33 <- input$p_33
    
    # bjm0 is the intercept for category j in nest m
    # for each nest, one of the intercepts is zero
    b_110 <- input$b_110
    b_210 <- input$b_210
    b_120 <- input$b_120
    b_220 <- input$b_220
    b_130 <- input$b_130
    b_230 <- input$b_230
    
    # bjm1 is the price coefficient for category j in nest m
    b_111 <- input$b_111
    b_211 <- input$b_211
    b_311 <- input$b_311
    b_121 <- input$b_121
    b_221 <- input$b_221
    b_321 <- input$b_321
    b_131 <- input$b_131
    b_231 <- input$b_231
    b_331 <- input$b_331
    
    
    # there is also a nest and individual-specific variable Z_im
    z_1 <- input$z_1
    z_2 <- input$z_2
    z_3 <- input$z_3
    
    # alpha_m0 is the intercept in the nest probability for nest m
    # a_310 is set to zero for identification
    a_10 <- input$a_10
    a_20 <- input$a_20
    
    # alpha_m1 is the coefficient of Z_im for nest m
    a_11 <- input$a_11
    a_21 <- input$a_21
    a_31 <- input$a_31
    
    # there is also a tau_m paramter for each nest m
    tau_1 <- input$tau_1
    tau_2 <- input$tau_2
    tau_3 <- input$tau_3
    
    probs_j1condm1 <- exp(b_110 + b_111*pts_p11 )/(exp(b_110 + b_111*p_11 ) + exp(b_210 + b_211*p_21 ) + exp(b_310 + b_311*p_31 ))
    probs_j2condm1 <- exp(b_210 + b_211*p_21 )/(exp(b_110 + b_111*p_11 ) + exp(b_210 + b_211*p_21 ) + exp(b_310 + b_311*p_31 ))
    probs_j3condm1 <- exp(b_310 + b_311*p_31 )/(exp(b_110 + b_111*p_11 ) + exp(b_210 + b_211*p_21 ) + exp(b_310 + b_311*p_31 ))

    # constant with respect to p_11 for nests 2 and 3
    probs_j1condm2 <- exp(b_120 + b_121*p_12 )/(exp(b_120 + b_121*p_12 ) + exp(b_220 + b_221*p_22 ) + exp(b_320 + b_321*p_32 ))
    probs_j2condm2 <- exp(b_220 + b_221*p_22 )/(exp(b_120 + b_121*p_12 ) + exp(b_220 + b_221*p_22 ) + exp(b_320 + b_321*p_32 ))
    probs_j3condm2 <- exp(b_320 + b_321*p_32 )/(exp(b_120 + b_121*p_12 ) + exp(b_220 + b_221*p_22 ) + exp(b_320 + b_321*p_32 ))

    probs_j1condm3 <- exp(b_130 + b_131*p_13 )/(exp(b_130 + b_131*p_13 ) + exp(b_230 + b_231*p_23 ) + exp(b_330 + b_331*p_33 ))
    probs_j2condm3 <- exp(b_230 + b_231*p_23 )/(exp(b_130 + b_131*p_13 ) + exp(b_230 + b_231*p_23 ) + exp(b_330 + b_331*p_33 ))
    probs_j3condm3 <- exp(b_330 + b_331*p_33 )/(exp(b_130 + b_131*p_13 ) + exp(b_230 + b_231*p_23 ) + exp(b_330 + b_331*p_33 ))

    # inclusive values
    # vary with p_11 for nest 1
    IV_m1 <- log(exp(b_110 + b_111*p_11 ) + exp(b_210 + b_211*p_21 ) + exp(b_310 + b_311*p_31 )) # vector
    IV_m2 <- log(exp(b_120 + b_121*p_12 ) + exp(b_220 + b_221*p_22 ) + exp(b_320 + b_321*p_32 )) # scalar
    IV_m3 <- log(exp(b_130 + b_131*p_13 ) + exp(b_230 + b_231*p_23 ) + exp(b_330 + b_331*p_33 )) # scalar


    # unconditional probabilties of nests
    probs_m1 <- exp(a_10 + a_11*pts_pz1 + tau_1*IV_m1)/( exp(a_10 + a_11*pts_pz1 + tau_1*IV_m1)  + exp(a_20 + a_21*z_2 + tau_2*IV_m2) + exp(a_30 + a_31*z_3 + tau_3*IV_m3) )
    probs_m2 <- exp(a_20 + a_21*z_2 + tau_2*IV_m2)/( exp(a_10 + a_11*pts_pz1 + tau_1*IV_m1)  + exp(a_20 + a_21*z_2 + tau_2*IV_m2) + exp(a_30 + a_31*z_3 + tau_3*IV_m3) )
    probs_m3 <- exp(a_30 + a_31*z_3 + tau_3*IV_m3)/( exp(a_10 + a_11*pts_pz1 + tau_1*IV_m1)  + exp(a_20 + a_21*z_2 + tau_2*IV_m2) + exp(a_30 + a_31*z_3 + tau_3*IV_m3) )

    # unconditional probabilities of nest-item combinations
    probs_j1_m1 <- probs_j1condm1*probs_m1
    probs_j2_m1 <- probs_j2condm1*probs_m1
    probs_j3_m1 <- probs_j3condm1*probs_m1

    probs_j1_m2 <- probs_j1condm2*probs_m2
    probs_j2_m2 <- probs_j2condm2*probs_m2
    probs_j3_m2 <- probs_j3condm2*probs_m2

    probs_j1_m3 <- probs_j1condm3*probs_m3
    probs_j2_m3 <- probs_j2condm3*probs_m3
    probs_j3_m3 <- probs_j3condm3*probs_m3
    ## Evaluate odds and plot
    odds_num <- input$odds_num
    odds_denom <- input$odds_denom
    probs_num <- 1
    probs_denom <- 1
    if(odds_num == 1){ probs_num <- probs_j1_m1}
    if(odds_num == 2){ probs_num <- probs_j2_m1}
    if(odds_num == 3){ probs_num <- probs_j3_m1}
    if(odds_num == 4){ probs_num <- probs_j1_m2}
    if(odds_num == 5){ probs_num <- probs_j2_m2}
    if(odds_num == 6){ probs_num <- probs_j3_m2}
    if(odds_num == 7){ probs_num <- probs_j1_m3}
    if(odds_num == 8){ probs_num <- probs_j2_m3}
    if(odds_num == 9){ probs_num <- probs_j3_m3}

    if(odds_denom == 1){ probs_denom <- probs_j1_m1}
    if(odds_denom == 2){ probs_denom <- probs_j2_m1}
    if(odds_denom == 3){ probs_denom <- probs_j3_m1}
    if(odds_denom == 4){ probs_denom <- probs_j1_m2}
    if(odds_denom == 5){ probs_denom <- probs_j2_m2}
    if(odds_denom == 6){ probs_denom <- probs_j3_m2}
    if(odds_denom == 7){ probs_denom <- probs_j1_m3}
    if(odds_denom == 8){ probs_denom <- probs_j2_m3}
    if(odds_denom == 9){ probs_denom <- probs_j3_m3}

    oddsplot <- probs_num/probs_denom

    plot(pts_pz1, oddsplot, xlim = c(-5,5), ylim = c(min(c(0,oddsplot)), max(c(0,oddsplot))), lwd = 2, col = "darkgoldenrod3", type = "l",
         xlab = "z1", ylab = "Odds against z1")

  })

  output$plot10 <- renderPlot({
    b_310 <- 0 #input$b_310
    b_320 <- 0 #input$b_320
    b_330 <- 0 #input$b_330
    a_30 <- 0 # input$a_30
    
    p_11 <- input$p_11
    p_21 <- input$p_21
    p_31 <- input$p_31
    p_12 <- input$p_12
    p_22 <- input$p_22
    p_32 <- input$p_32
    p_13 <- input$p_13
    p_23 <- input$p_23
    p_33 <- input$p_33
    
    # bjm0 is the intercept for category j in nest m
    # for each nest, one of the intercepts is zero
    b_110 <- input$b_110
    b_210 <- input$b_210
    b_120 <- input$b_120
    b_220 <- input$b_220
    b_130 <- input$b_130
    b_230 <- input$b_230
    
    # bjm1 is the price coefficient for category j in nest m
    b_111 <- input$b_111
    b_211 <- input$b_211
    b_311 <- input$b_311
    b_121 <- input$b_121
    b_221 <- input$b_221
    b_321 <- input$b_321
    b_131 <- input$b_131
    b_231 <- input$b_231
    b_331 <- input$b_331
    
    
    # there is also a nest and individual-specific variable Z_im
    z_1 <- input$z_1
    z_2 <- input$z_2
    z_3 <- input$z_3
    
    # alpha_m0 is the intercept in the nest probability for nest m
    # a_310 is set to zero for identification
    a_10 <- input$a_10
    a_20 <- input$a_20
    
    # alpha_m1 is the coefficient of Z_im for nest m
    a_11 <- input$a_11
    a_21 <- input$a_21
    a_31 <- input$a_31
    
    # there is also a tau_m paramter for each nest m
    tau_1 <- input$tau_1
    tau_2 <- input$tau_2
    tau_3 <- input$tau_3
    
    probs_j1condm1 <- exp(b_110 + b_111*pts_p11 )/(exp(b_110 + b_111*p_11 ) + exp(b_210 + b_211*p_21 ) + exp(b_310 + b_311*p_31 ))
    probs_j2condm1 <- exp(b_210 + b_211*p_21 )/(exp(b_110 + b_111*p_11 ) + exp(b_210 + b_211*p_21 ) + exp(b_310 + b_311*p_31 ))
    probs_j3condm1 <- exp(b_310 + b_311*p_31 )/(exp(b_110 + b_111*p_11 ) + exp(b_210 + b_211*p_21 ) + exp(b_310 + b_311*p_31 ))

    # constant with respect to p_11 for nests 2 and 3
    probs_j1condm2 <- exp(b_120 + b_121*p_12 )/(exp(b_120 + b_121*p_12 ) + exp(b_220 + b_221*p_22 ) + exp(b_320 + b_321*p_32 ))
    probs_j2condm2 <- exp(b_220 + b_221*p_22 )/(exp(b_120 + b_121*p_12 ) + exp(b_220 + b_221*p_22 ) + exp(b_320 + b_321*p_32 ))
    probs_j3condm2 <- exp(b_320 + b_321*p_32 )/(exp(b_120 + b_121*p_12 ) + exp(b_220 + b_221*p_22 ) + exp(b_320 + b_321*p_32 ))

    probs_j1condm3 <- exp(b_130 + b_131*p_13 )/(exp(b_130 + b_131*p_13 ) + exp(b_230 + b_231*p_23 ) + exp(b_330 + b_331*p_33 ))
    probs_j2condm3 <- exp(b_230 + b_231*p_23 )/(exp(b_130 + b_131*p_13 ) + exp(b_230 + b_231*p_23 ) + exp(b_330 + b_331*p_33 ))
    probs_j3condm3 <- exp(b_330 + b_331*p_33 )/(exp(b_130 + b_131*p_13 ) + exp(b_230 + b_231*p_23 ) + exp(b_330 + b_331*p_33 ))

    # inclusive values
    # vary with p_11 for nest 1
    IV_m1 <- log(exp(b_110 + b_111*p_11 ) + exp(b_210 + b_211*p_21 ) + exp(b_310 + b_311*p_31 )) # vector
    IV_m2 <- log(exp(b_120 + b_121*p_12 ) + exp(b_220 + b_221*p_22 ) + exp(b_320 + b_321*p_32 )) # scalar
    IV_m3 <- log(exp(b_130 + b_131*p_13 ) + exp(b_230 + b_231*p_23 ) + exp(b_330 + b_331*p_33 )) # scalar


    # unconditional probabilties of nests
    probs_m1 <- exp(a_10 + a_11*pts_pz1 + tau_1*IV_m1)/( exp(a_10 + a_11*pts_pz1 + tau_1*IV_m1)  + exp(a_20 + a_21*z_2 + tau_2*IV_m2) + exp(a_30 + a_31*z_3 + tau_3*IV_m3) )
    probs_m2 <- exp(a_20 + a_21*z_2 + tau_2*IV_m2)/( exp(a_10 + a_11*pts_pz1 + tau_1*IV_m1)  + exp(a_20 + a_21*z_2 + tau_2*IV_m2) + exp(a_30 + a_31*z_3 + tau_3*IV_m3) )
    probs_m3 <- exp(a_30 + a_31*z_3 + tau_3*IV_m3)/( exp(a_10 + a_11*pts_pz1 + tau_1*IV_m1)  + exp(a_20 + a_21*z_2 + tau_2*IV_m2) + exp(a_30 + a_31*z_3 + tau_3*IV_m3) )

    # unconditional probabilities of nest-item combinations
    probs_j1_m1 <- probs_j1condm1*probs_m1
    probs_j2_m1 <- probs_j2condm1*probs_m1
    probs_j3_m1 <- probs_j3condm1*probs_m1

    probs_j1_m2 <- probs_j1condm2*probs_m2
    probs_j2_m2 <- probs_j2condm2*probs_m2
    probs_j3_m2 <- probs_j3condm2*probs_m2

    probs_j1_m3 <- probs_j1condm3*probs_m3
    probs_j2_m3 <- probs_j2condm3*probs_m3
    probs_j3_m3 <- probs_j3condm3*probs_m3
    # total marginal effects of z1 on P

    PE_j1_m1 <- a_11 * probs_j1_m1 * (1 - probs_m1)
    PE_j2_m1 <- a_11 * probs_j2_m1 * (1 - probs_m1)
    PE_j3_m1 <- a_11 * probs_j3_m1 * (1 - probs_m1)
    PE_j1_m2 <- - a_21 * probs_j1_m1 * probs_m2
    PE_j2_m2 <- - a_21 * probs_j2_m1 * probs_m2
    PE_j3_m2 <- - a_21 * probs_j3_m1 * probs_m2
    PE_j1_m3 <- - a_31 * probs_j1_m1 * probs_m3
    PE_j2_m3 <- - a_31 * probs_j2_m1 * probs_m3
    PE_j3_m3 <- - a_31 * probs_j3_m1 * probs_m3

    lowertmp <- min(0,PE_j1_m1,PE_j2_m1,PE_j3_m1,
                    PE_j1_m2,PE_j2_m2,PE_j3_m2,
                    PE_j1_m3,PE_j2_m3,PE_j3_m3)
    uppertmp <- max(0,PE_j1_m1,PE_j2_m1,PE_j3_m1,
                    PE_j1_m2,PE_j2_m2,PE_j3_m2,
                    PE_j1_m3,PE_j2_m3,PE_j3_m3)

    plot(pts_pz1, PE_j1_m1, xlim = c(-5, 5), ylim = c(lowertmp,uppertmp ), lwd = 2, col = "darkgoldenrod3", type = "l",
         xlab = "z1", ylab = "PE of z1 on Pr(Y=j, S=m)")
    lines(pts_pz1, PE_j2_m1,  col = "#CC6677", type = "l")
    lines(pts_pz1, PE_j3_m1,  col = "#DDCC77", type = "l")
    lines(pts_pz1, PE_j1_m2,  col = "#117733", type = "l")
    lines(pts_pz1, PE_j2_m2,  col = "#332288", type = "l")
    lines(pts_pz1, PE_j3_m2,  col = "#AA4499", type = "l")
    lines(pts_pz1, PE_j1_m3,  col = "#44AA99", type = "l")
    lines(pts_pz1, PE_j2_m3,  col = "#999933", type = "l")
    lines(pts_pz1, PE_j3_m3,  col = "#882255", type = "l")


  })
  
})

classdef NeuralNetwork < handle
    %NEURALNETWORK Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        Layers
        Sigmas
        W
        b
        Z
        A
        dW
        db
        maxTrain
        minTrain
        normalize
    end
    
    methods
        function obj = NeuralNetwork(Layers, Sigmas)
            %NEURALNETWORK Construct an instance of this class
            %   Detailed explanation goes here
            obj.Layers = Layers;
            obj.Sigmas = Sigmas;
            
            obj.maxTrain = ones(Layers{1}, 1)*realmin;
            obj.minTrain = ones(Layers{1}, 1)*realmax;
        end
        
        function [a] = plot_activation(obj, l, i, osize)
            a = obj.A{l}(i,:);
            a = reshape(a, osize);
        end
        
        function [] = batch_train(obj, X, Y, eta, CostFunction)
            YHat = obj.feedforward(X);
            obj.backpropagation(Y, YHat, CostFunction);
            obj.update_parameters(eta)
        end
        
        function [Ctrain, Ctest] = train(obj, Xtrain, Ytrain, Xtest, Ytest, epochs, batch_size, eta, CostFunction)
            %TRAIN Summary of this function goes here
            %   Detailed explanation goes here

            M = size(Xtrain,2);
            Ctrain = zeros(epochs,1);
            Ctest = zeros(epochs,1);

            for t=1:epochs
                % extract batch at random
                idx = randperm(M, batch_size);
                X = Xtrain(:,idx);
                Y = Ytrain(:,idx);
                obj.batch_train(X, Y, eta, CostFunction);

                % evaluate the cost
                Ctrain(t) = obj.evaluate(X, Y, CostFunction);
                Ctest(t) = obj.evaluate(Xtest, Ytest, CostFunction);
            end
        end
        
        function [c] = evaluate(obj, Xtest, Ytest, CostFunction)
            %EVALUATE Summary of this function goes here
            %   Detailed explanation goes here
            YHat = obj.feedforward(Xtest);
            c = cost_function(YHat, Ytest, CostFunction);
        end
        
        function [YHat] = feedforward(obj, X)
            %UNTITLED Summary of this function goes here
            %   Detailed explanation goes here
            [YHat, obj.A, obj.Z] = forward_pass(X, obj.W, obj.b, obj.Sigmas);
        end
        
        function [dZ] = backpropagation(obj, Y, YHat, typeCost)
            %BACKPROPAGATION Summary of this function goes here
            %   Detailed explanation goes here
            dE = cost_derivative(YHat, Y,  typeCost, obj.Sigmas{end});
            [dZ, obj.dW, obj.db] = backward_pass(dE, obj.W, obj.A, obj.Z, obj.Sigmas);
        end
        
        function [] = update_parameters(obj, eta)
            [obj.W, obj.b] = update_weights(obj.W, obj.b, obj.dW, obj.db, eta);
        end
        
        function [] = initialize(obj, type)
            [obj.W, obj.b] = initialize_weights(obj.Layers, type);
        end
    end
end


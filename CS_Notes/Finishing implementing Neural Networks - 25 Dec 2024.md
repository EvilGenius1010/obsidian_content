In the last blog I had tried to implement neural networks from scratch. I had written some boilerplate code for the structure of the input layers.

The expression we ended with in the last blog was $\sum_{n=0}^{n=n} w_i*a_i +b$ or to put it more explicitly,
$\sigma(w_1a_1+w_2a_2...+w_na_n +b)$ . Here,
	1. $w$ stands for the weight ie. a value we can adjust to find the correct output.
	2. $a$ stands for $activation$ which is basically how bright a pixel is at a point.
	3. $b$ stands for $bias$ which basically

- Initially, we take all the weight values randomly. Then we "train" the network to find the correct weights. How? We basically give the network a set of images and run it so that the network finds the values accordingly.

# Cost Functions

- Running the network on a bunch of images and asking it to identify it is fine but how do we make the network understand whether what output it is getting is correct or not ie. if the image it runs is say a 2 and network runs and identifies it as a 6 how to make the computer understand how much error it is encountering?
- Here is when cost functions come in.
- It is the difference between the networks' output and the actual output squared.
$$(Actual \ Output \ - \ Network \ Output)^2$$ 
- Why the square? It is to penalize larger errors.
- This difference is called the cost of a single training example.
- This is to make the network understand how big of an error is in its output. But we also need a mechanism to correct the weights. 
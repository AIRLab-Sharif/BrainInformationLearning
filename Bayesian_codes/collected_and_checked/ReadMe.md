## three_state_shannon

Input:
String of stimulus: S_{1:n}
Weight: Memory Weight
n: the number of possible stimulus, the number of state each element of the input sequence can get.

Output: Shannon Surprise

For Memory Weight see:
"Human inferences about sequences: A minimal transition probability model"

you can find the above article in the mendeley

For more details about the implementation please see the
"Trial-by-trial surprise-decoding model for visual and auditory binary oddball tasks" 

See the equation (1) to (5) of the above article

The output is the array containing the surprise value associated to each element of input sequence


## three_state_shannon_SM

Input:
String of stimulus: S_{1:n}
Weight: Memory Weight
n: the number of possible stimulus, the number of state each element of the input sequence can get.

Output: Shannon Surprise

The above code the simplified implementation of shannon surprise and use the fact that the posterior distribution is the dirichlet distribution. 

Try to find that why both of the three_state_shannon_SM and three_state_shannon have the same output given the same input?

## three_state_KL_on_params

Input:
String of stimulus: S_{1:n}
Weight: Memory Weight


Output: KL divergence KL(P(\theta|S_{1:n-1})||P(\theta|S_{1:n}))

For the implementation see the file Model2.pdf


## three_state_KL_on_params_SM

Input:
String of stimulus: S_{1:n}
Weight: Memory Weight


Output: KL divergence KL(P(\theta|S_{1:n-1})||P(\theta|S_{1:n}))

"three_state_KL_on_params_SM" and "three_state_KL_on_params" have the same output given the same input. 

Again, we use the fact that the posterior distribution P(\theta|S_{1:n-1}) is the dirichlet distribution. 

To find how the implmentation has been done, you need to know the KL divergence between two Dirichlet distributions.

Try to find what is the closed form of the This KL

## Confidence_Corrected

Input:
String of stimulus: S_{1:n}
Weight: Memory Weight


Output: Confidence Corrected Surprise 


It is going to calculate the Surprise based on the implementation mentioned in the following article

"Balancing New against Old Information: The Role of Puzzlement Surprise in Learning"

the Learning step needs to be done 
Please check the calculation of Surprise Confidence Corrected "S_cc", I have done. 
Then,implement the Learning step in the area of the code I have marked for you






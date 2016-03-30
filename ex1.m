clear;
N = 4;

C = 1; S = 2; R = 3; W = 4;
dag = zeros(N,N);
dag(C,[R S]) = 1;
dag(R,W) = 1;
dag(S,W)=1;
names = {'C' 'S' 'R' 'W'};
G = digraph(dag,names,'OmitSelfLoops');
node_sizes = 2*ones(1,N);

bnet = mk_bnet(dag, node_sizes);

bnet.CPD{C} = tabular_CPD(bnet, C, [0.5 0.5]);
bnet.CPD{R} = tabular_CPD(bnet, R, [0.8 0.2 0.2 0.8]);
bnet.CPD{S} = tabular_CPD(bnet, S, [0.5 0.9 0.5 0.1]);
bnet.CPD{W} = tabular_CPD(bnet, W, [1 0.1 0.1 0.01 0 0.9 0.9 0.99]);
evidence = cell(1,N);
evidence{W} = 2;
plot(G,'LineWidth',2,'MarkerSize',20,'Edge,[]

'<','Arrowsize',20);

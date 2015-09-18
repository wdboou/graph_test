# first try of igraph package
source('helper.r')
pac_list <- c('igraph',
              'CIDnetworks')
suppressWarnings(loadPac(pac_list))

data(dolphins)

layout <- layout.fruchterman.reingold

# plot 1
dol <- graph.data.frame(dolphins)
jpeg(filename='dolphins.jpg',
     width=800, 
     height=800, 
     units='px')
plot(dol,
     vertex.size=5,
     layout=layout,
     vertex.shape='circle',
     vertex.label.cex=1.0,
     vertex.label.color='black',
     edge.arrow.size=0) 
dev.off()

# plot 2
jpeg(filename="dolphins_sub1.jpg",
     width=800, 
     height=800,
     units='px')
gn <- graph.neighborhood(dol, 
                         order=1)
plot(gn[[1]],
     layout=layout)
dev.off()

# plot 3
jpeg(filename="dolphins_sub2.jpg",
     width=800, 
     height=800,
     units='px')
gn <- graph.neighborhood(dol, 
                         order=2)
plot(gn[[2]],
     layout=layout)
dev.off()
# plot 4
jpeg(filename="dolphins_sub3.jpg",
     width=800, 
     height=800,
     units='px')
gn <- graph.neighborhood(dol, 
                         order=1)
plot(gn[[1]]+gn[[2]],
     layout=layout)
dev.off()

# plot 5
source("http://michael.hahsler.net/SMU/ScientificCompR/code/map.R")
E(dol)$curved <- 0.2   # #?????????????????????,????????????????????????
jpeg(filename='dolphins_curve1.jpg',
     width=800,
     height=800,
     units='px')
plot(dol, 
     layout=layout,
     vertex.size = map(degree(dol),
                       c(1,20)),
     vertex.color= map(degree(dol),
                       c(1,20)))
dev.off()

# plot 6
cl <- optimal.community(dol)
E(dol)$curved <- 0
jpeg(filename="dolphins_commu2.jpg", 
     width=800, 
     height=800, 
     units='px')
plot(dol,
     layout=layout,
     vertex.size = map(degree(dol),
                       c(1,20)),
     vertex.color = rainbow(10,.8,.8,alpha=.8)[cl$membership+1L])
dev.off()

# plot 7
sg1 <- cluster_spinglass(dol, 
                         spins = 3, 
                         gamma=1.0) # spin is the number of cummunity
jpeg(filename="dolphins_commu3.jpg", 
     width=800, 
     height=800,
     units='px')
plot(dol,
     layout=layout,
     vertex.size=5,
     vertex.color=rainbow(10,
                          .8,
                          .8,
                          alpha=0.8)[sg1$membership])
dev.off()

# plot 8
sg1 <- cluster_spinglass(dol, spins=3, gamma=1.0)
jpeg(filename='dolphins_subcommu.jpg', 
     width=800, 
     height=800, 
     units='px')
subg <- induced.subgraph(dol, 
                         which(membership(sg1)==1))
plot(subg, 
     layout=layout, 
     vertex.size=5, 
     vertex.color=1,)
dev.off()

# plot 9
sg1 <- cluster_spinglass(dol, 
                         spins=3, 
                         gamma=1.0)
jpeg(filename='dolphins_commu10.jpg',
     width=800, 
     height=800,
     units='px')
plot(dol,layout=layout.circle,
     vertex.size=5, 
     vertex.color=rainbow(10,
                          .8,
                          .8,
                          alpha=.8)[sg1$membership])
dev.off()

# plot 10
sg1 <- cluster_spinglass(dol, 
                         spins=3, 
                         gamma=1.0)
jpeg(filename='dolphins_commu11.jpg',
     width=800,
     height=800,
     units='px')
layout = layout.sphere
plot(dol, 
     layout=layout,
     vertex.size=5,
     vertex.color=rainbow(10,
                          .8,
                          .8,
                          alpha=.8)[sg1$membership])
dev.off()

# ok finish this part




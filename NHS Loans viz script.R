####Loans####

Loansviz <- ggplot(data = Loans,
                aes(x = Year,
                    y = Debts))+
  geom_bar(stat = "identity",
           position = "identity",
           fill = bbc_pal("blue"))+
  geom_hline(yintercept = 0, size = 1, colour="#333333") +
  bbc_style() +
  labs(title="Bailouts have doubled in three years",
subtitle = "Interim revenue support debt held by NHS England trusts")+
  scale_y_continuous(breaks = c(0, 2, 4, 6, 8, 10, 12),
                     labels = c("", "", "", "", "", "", ""))+
  theme(panel.grid.major.x = element_blank(), 
        panel.grid.major.y = element_blank())

Loansviz

Loansviz2 <- Loansviz +
geom_label(aes(x = Year, y = Debts, label = paste0(Text)),
             hjust = 0.5,
             vjust = 1,
             colour = "white",
             fill = NA,
             label.size = NA,
             family="Helvetica",
             size = 6)

Loansviz2

#save out

finalise_plot(plot_name = Loansviz2,
              source = "Source: Department for Health and Social Care",
              width_pixels = 640,
              height_pixels = 550,
              save_filepath = "Loansviz.png")

####Trusts####

rm(Trusts,Trustsviz,Trustsviz2)

names(Trusts)<-str_replace_all(names(Trusts), c(" " = "." , "," = "" ))

Trustsviz <- ggplot(data = Trusts,
                   aes(x = reorder(Organisation.name, Debts),
                       y = Debts))+
  geom_bar(stat = "identity",
           position = "identity",
           fill = bbc_pal("blue"))+
  geom_hline(yintercept = 0, size = 1, colour="#333333") +
  bbc_style() +
  labs(title="Interim support loans taken out by trusts",
       subtitle = "Outstanding debt in March 2019")+
  scale_y_continuous(breaks = c(0, 200, 400, 600),
                     labels = c("", "", "", ""))+
  theme(panel.grid.major.x = element_blank(),
        panel.grid.major.y = element_blank())+
  coord_flip()

Trustsviz

Trustsviz2 <- Trustsviz +
  geom_label(aes(x = Organisation.name, y = Debts, label = paste0(Text)),
             hjust = 1,
             vjust = 0.9,
             colour = "white",
             fill = NA,
             label.size = NA,
             family="Helvetica",
             size = 6)

Trustsviz2


Trustsviz2 <- Trustsviz2 + coord_flip()

#save out

finalise_plot(plot_name = Trustsviz2,
              source = "Source: Department of Health and Social Care",
              width_pixels = 640,
              height_pixels = 550,
              save_filepath = "Trustsviz.png")


class sudoko;

	bit [3:0] ip[9][9];	//Input Board 9x9 Sudoku
	bit [3:0] op[9][9];	//Output Board 9x9 after Solving the puzzle

	rand bit [3:0] board[9][9];

	
	
	constraint c1{foreach(board[i,j])
			  board[i][j] inside {[1:9]};	}	//this constraint  make sures that every cell contains value between the range from 1 to 9


	constraint c2{foreach(board[i,j])
				   foreach(board[l,])
					if(i!=l )		
						board[i][j]!=board[l][j];
				   }	
				   //the above constraint c2 make sures that each element in every column of the sudoku board is unique.
				   

	constraint c3{foreach(board[i,j])
			     foreach(board[,k])
			        if(j!=k)
				   board[i][j]!=board[i][k];
			}
				//the above constraint c3 make sures that each element in every row of the sudoku board is unique


	constraint c4{foreach(board[i,j])
			if(ip[i][j]!=0)
				board[i][j]==ip[i][j];
			}
				//the above constraint c4 make sures that  any non zero element in the sudoku board are preserved and remain unchanged during randomization process
				//which is important for maintaining the integrity of the initial sudoku puzzle
				


	constraint c5{foreach(board[i,j])
			foreach(board[k,l])
				if(i/3==k/3 && j/3 == l/3 && !(i==k && j==l))
					board[i][j]!=board[k][l];
	}
			//this constraint guarantees that each 3x3 subgrid of sudoku board contains unique values.
	


	function void post_randomize();
		foreach(op[i,j])
			op[i][j] = board[i][j];	//after randomization,values from board variable is copied to op
	endfunction


	function void display(bit[3:0] a[9][9]);
		$display("\n\n");
		foreach(a[i,])
		 begin	
			foreach(a[,j])
				$write("%3d",a[i][j]);

			$display();
		 end

	endfunction

endclass


module test;

	sudoko h;


		initial
			begin
				h=new;
				$display("\n================	EASY LEVEL SUDOKU	=============	\n");
				h.ip= '{{0,0,0,2,6,0,7,0,1},
					{6,8,0,0,7,0,0,9,0},
					{1,9,0,0,0,4,5,0,0},
					{8,2,0,1,0,0,0,4,0},
					{0,0,4,6,0,2,9,0,0},
					{0,5,0,0,0,3,0,2,8},
					{0,0,9,3,0,0,0,7,4},
					{0,4,0,0,5,0,0,3,6},
					{7,0,3,0,1,8,0,0,0}	};
					
				h.display(h.ip);
				h.randomize;
				h.display(h.op);

				$display("\n=============	INTERMEDIATE LEVEL SUDOKU  ==========	\n");
				
				h.ip='{ {0,2,0,6,0,8,0,0,0},
					{5,8,0,0,0,9,7,0,0},
					{0,0,0,0,4,0,0,0,0},
					{3,7,0,0,0,0,5,0,0},
					{6,0,0,0,0,0,0,0,4},
					{0,0,8,0,0,0,0,1,3},
					{0,0,0,0,2,0,0,0,0},
					{0,0,9,8,0,0,0,3,6},
					{0,0,0,3,0,6,0,9,0}	};
				h.display(h.ip);
				h.randomize;
				h.display(h.op);
				
				$display("\n=============	DIFICULT LEVEL SUDOKU	===========   \n");
				
				h.ip='{ {0,0,0,6,0,0,4,0,0},
					{7,0,0,0,0,3,6,0,0},
					{0,0,0,0,9,1,0,8,0},
					{0,0,0,0,0,0,0,0,0},
					{0,5,0,1,8,0,0,0,3},
					{0,0,0,3,0,6,0,4,5},
					{0,4,0,2,0,0,0,6,0},
					{9,0,3,0,0,0,0,0,0},
					{0,2,0,0,0,0,1,0,0}	};
				h.display(h.ip);
				h.randomize;
				h.display(h.op);


			end
endmodule
	
	

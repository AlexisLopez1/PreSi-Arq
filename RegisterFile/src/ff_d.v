module ff_d(input d, clk, rst, en, output reg q);
	
	always @ (posedge clk or negedge rst) begin
		if (!rst) begin
			q <= 1'b0;
		end
		else begin
			if (en) begin
				q <= d;
			end
		end
	end
	
endmodule 
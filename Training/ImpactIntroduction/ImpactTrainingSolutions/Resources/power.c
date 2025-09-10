double power(double val, int pow)
{       double ret_val = 1.0;
        int i;
        for(i = 0; i < pow; i++)
                ret_val *= val;                
        return(ret_val);
}
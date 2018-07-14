/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package collegeclub;

/**
 *
 * @author HP
 */
public class searcharray {
    int index=0;
    int find(long comboid[], long a)
    {
        while(comboid[index]!=a)
        {
            index++;
        }
        return index;
        }
    }



#include "../inc/fdf.h"

int main(int ac, char **av)
{
    data_t  *data;

    data = (data_t*)malloc(sizeof(data_t));
    data->mlx_ptr = mlx_init();
    data->mlx_win = mlx_new_window(data->mlx_ptr, 1920, 1080, "Hello World");  
   //mlx_pixel_put(data->mlx_ptr, data->mlx_win, 640, 380, 0xE2EDEC);
    mlx_loop(data->mlx_ptr);
    return (0);
}
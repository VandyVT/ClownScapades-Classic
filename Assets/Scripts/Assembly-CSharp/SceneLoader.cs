using System;
using UnityEngine;
using UnityEngine.SceneManagement;

// Token: 0x02000027 RID: 39
public class SceneLoader : MonoBehaviour
{
	// Token: 0x0600009B RID: 155 RVA: 0x0000378C File Offset: 0x0000198C
	public void TimescaleFix()
	{
		Time.timeScale = 1f;
	}

	// Token: 0x0600009C RID: 156 RVA: 0x00003C39 File Offset: 0x00001E39
	public void MainMenu()
	{
		Time.timeScale = 1f;
		SceneManager.LoadScene("MainMenu");
	}

	// Token: 0x0600009D RID: 157 RVA: 0x00003C50 File Offset: 0x00001E50
	public void ReloadGame()
	{
		SceneManager.LoadScene(SceneManager.GetActiveScene().name);
	}

	// Token: 0x0600009E RID: 158 RVA: 0x000037D4 File Offset: 0x000019D4
	public void QuitGame()
	{
		Application.Quit();
	}
}

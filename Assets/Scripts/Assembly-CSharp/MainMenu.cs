using System;
using UnityEngine;
using UnityEngine.SceneManagement;

// Token: 0x0200001F RID: 31
public class MainMenu : MonoBehaviour
{
	// Token: 0x0600007C RID: 124 RVA: 0x0000378C File Offset: 0x0000198C
	private void Start()
	{
		Time.timeScale = 1f;
	}

	// Token: 0x0600007D RID: 125 RVA: 0x00003798 File Offset: 0x00001998
	public void PlayCh1()
	{
		SceneManager.LoadScene("CH1Cut");
	}

	// Token: 0x0600007E RID: 126 RVA: 0x000037A4 File Offset: 0x000019A4
	public void PlayCh2()
	{
		SceneManager.LoadScene("MainGame1");
	}

	// Token: 0x0600007F RID: 127 RVA: 0x000037B0 File Offset: 0x000019B0
	public void WaitCh1()
	{
		base.Invoke("PlayCh1", 8f);
	}

	// Token: 0x06000080 RID: 128 RVA: 0x000037C2 File Offset: 0x000019C2
	public void WaitCh2()
	{
		base.Invoke("PlayCh2", 8f);
	}

	// Token: 0x06000081 RID: 129 RVA: 0x000037D4 File Offset: 0x000019D4
	public void QuitGame()
	{
		Application.Quit();
	}
}
